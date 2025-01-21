import nncf
import openvino as ov
import torch
from torchvision import datasets, transforms
import argparse
import numpy as np
from segment_anything import sam_model_registry
from openvino.runtime import serialize
import os
from pathlib import Path
import cv2

def mobilevit_onnx():
    import sys
    sys.path.append("./")
    from model import mobile_vit_small as create_model
    model = create_model(num_classes=1000)
    model_weight_path = "mobilevit_s.pt"
    model.load_state_dict(torch.load(model_weight_path, map_location="cpu"))
    model.eval()

    torch.onnx.export(model,torch.ones(1, 3, 224, 224, requires_grad=True),"tmp.onnx",input_names = ['input'], output_names = ['output'],dynamic_axes={
        'input': {0: "batch_size",2:"input_height",3:"input_width"},
        'output': {0: "batch_size",2:"output_height",3:"output_width"},
        })
def mobilevit_ir():
    model = ov.Core().read_model("../../models/public/mobilevit/FP16/mobilevit_1_3_224_224.xml")
    val_dataset = datasets.ImageFolder("../../datasets/imagenet/val",transform=transforms.Compose([transforms.Resize([224, 224]), transforms.ToTensor()]))

    dataset_loader = torch.utils.data.DataLoader(val_dataset, batch_size=1)

    def transform_fn(data_item):
        images, _ = data_item
        return images

    calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
    quantized_model = nncf.quantize(
        model,
        calibration_dataset)

    from openvino.runtime import serialize
    int8_model_path = "../../models/public/mobilevit/FP16-INT8/mobilevit_1_3_224_224.xml"
    serialize(quantized_model, int8_model_path)
    quantized_model.reshape([4,3,224,224])
    int8_model_path4 = "../../models/public/mobilevit/FP16-INT8/mobilevit_4_3_224_224.xml"
    serialize(quantized_model, int8_model_path4)


def yolo(_input_path,_output_path,_batch,_size,_channels):
    ov_model = ov.Core().read_model(_input_path)
    val_dataset = datasets.CocoDetection(
        root="../../datasets/coco/images/val2017",
        annFile="../../datasets/coco/annotations/instances_val2017.json",
        transform=transforms.Compose([transforms.Resize([640, 640]), transforms.ToTensor()]))
    

    dataset_loader = torch.utils.data.DataLoader(val_dataset, batch_size=1)#,collate_fn=collate_fn)
    def transform_fn(data_item):
        images= data_item[0]
        if _channels=="NHWC":
            images=np.transpose(images,[0,2,3,1])
        return images

    calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
    quantized_model = nncf.quantize(
        ov_model,
        calibration_dataset)

    from openvino.runtime import serialize
    if _channels=="NHWC":
        quantized_model.reshape([int(_batch),_size[0],_size[1],3])
    else:
        quantized_model.reshape([int(_batch),3,_size[0],_size[1]])    
    serialize(quantized_model, _output_path)

def sam():
    checkpoint = "./sam_vit_b_01ec64.pth"
    model_type = "vit_b"

    from torchvision.transforms.functional import resize, to_pil_image
    import torch.utils.data as data
    sam = sam_model_registry[model_type](checkpoint=checkpoint)
    core = ov.Core()
    model=sam.image_encoder

    class ResizeLongestSide:
        """
        Resizes images to longest side 'target_length', as well as provides
        methods for resizing coordinates and boxes. Provides methods for
        transforming numpy arrays.
        """

        def __init__(self, target_length: int) -> None:
            self.target_length = target_length

        def apply_image(self, image: np.ndarray) -> np.ndarray:
            """
            Expects a numpy array with shape HxWxC in uint8 format.
            """
            target_size = self.get_preprocess_shape(image.shape[0], image.shape[1], self.target_length)
            return np.array(resize(to_pil_image(image), target_size))


        @staticmethod
        def get_preprocess_shape(oldh: int, oldw: int, long_side_length: int):
            """
            Compute the output size given input size and target long side length.
            """
            scale = long_side_length * 1.0 / max(oldh, oldw)
            newh, neww = oldh * scale, oldw * scale
            neww = int(neww + 0.5)
            newh = int(newh + 0.5)
            return (newh, neww)


    resizer = ResizeLongestSide(1024)

    def preprocess_image(image: np.ndarray):
        resized_image = resizer.apply_image(image)
        resized_image = (resized_image.astype(np.float32) - [123.675, 116.28, 103.53]) / [58.395, 57.12, 57.375]
        resized_image = np.expand_dims(np.transpose(resized_image, (2, 0, 1)).astype(np.float32), 0)

        # Pad
        h, w = resized_image.shape[-2:]
        padh = 1024 - h
        padw = 1024 - w
        x = np.pad(resized_image, ((0, 0), (0, 0), (0, padh), (0, padw)))
        return x

    class COCOLoader(data.Dataset):
        def __init__(self, images_path):
            self.images = list(Path(images_path).iterdir())

        def __getitem__(self, index):
            image_path = self.images[index]
            image = cv2.imread(str(image_path))
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            return image

        def __len__(self):
            return len(self.images)

    import nncf
    def transform_fn(image_data):
        image = image_data.numpy()
        processed_image = preprocess_image(np.squeeze(image))
        return np.transpose(processed_image,[0,2,3,1])

    ov_encoder_model = ov.convert_model(model, example_input=torch.zeros(1,3,1024,1024), input=([-1,3,-1,-1]))
    prep = ov.preprocess.PrePostProcessor(ov_encoder_model)
    prep.input("x").model().set_layout(ov.Layout("NCHW"))
    prep.input("x").tensor().set_layout(ov.Layout("NHWC"))
    ov_encoder_model = prep.build()
    ov.save_model(ov_encoder_model, "./tmp.xml", compress_to_fp16=True) 

    ov_encoder_model.reshape([1,1024,1024,3])
    ov.save_model(ov_encoder_model, "../../models/public/sam/FP16/sam_1_1024_1024_3.xml", compress_to_fp16=True) 


    coco_dataset = COCOLoader('../../datasets/coco/images/val2017')
    calibration_loader = torch.utils.data.DataLoader(coco_dataset,batch_size=1)
    calibration_dataset = nncf.Dataset(calibration_loader, transform_fn)
    ov_encoder_model=ov.Core().read_model("./tmp.xml")
    quantized_model = nncf.quantize(ov_encoder_model,
                                calibration_dataset,
                                model_type=nncf.parameters.ModelType.TRANSFORMER)
    quantized_model.reshape([4,1024,1024,3])                                
    ov.save_model(quantized_model, "../../models/public/sam/FP16-INT8/sam_4_1024_1024_3.xml")  
    del quantized_model 
    quantized_model = nncf.quantize(ov_encoder_model,
                            calibration_dataset,
                            model_type=nncf.parameters.ModelType.TRANSFORMER)
    quantized_model.reshape([1,1024,1024,3])                                
    ov.save_model(quantized_model, "../../models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml")      


def mobile_sam():
    import torch
    import openvino as ov
    from pathlib import Path
    import cv2
    import numpy as np
    from torchvision.transforms.functional import resize, to_pil_image
    from mobile_sam import sam_model_registry
    import torch.utils.data as data

    checkpoint = "./weights/mobile_sam.pt"
    model_type = "vit_t"
    sam = sam_model_registry[model_type](checkpoint=checkpoint)
    sam.to("cpu")
    core = ov.Core()
    model=sam.image_encoder

    ov_encoder_model = ov.convert_model(model, example_input=torch.zeros(1,3,1024,1024), input=([-1,3,-1,-1]))
    ov_encoder_model.reshape([1,3,1024,1024])
    ov.save_model(ov_encoder_model, "../../models/public/mobile_sam/FP16/mobile_sam_1_3_1024_1024.xml", compress_to_fp16=True) 
    ov.save_model(ov_encoder_model, "../../models/public/mobile_sam/FP32/mobile_sam_1_3_1024_1024.xml", compress_to_fp16=False) 
    del ov_encoder_model
    ov_encoder_model = ov.convert_model(model, example_input=torch.zeros(4,3,1024,1024), input=([-1,3,-1,-1]))
    ov_encoder_model.reshape([4,3,1024,1024])
    ov.save_model(ov_encoder_model, "../../models/public/mobile_sam/FP16/mobile_sam_4_3_1024_1024.xml", compress_to_fp16=True) 
    ov.save_model(ov_encoder_model, "../../models/public/mobile_sam/FP32/mobile_sam_4_3_1024_1024.xml", compress_to_fp16=False) 
    del sam
    
    class ResizeLongestSide:
        def __init__(self, target_length: int) -> None:
            self.target_length = target_length

        def apply_image(self, image: np.ndarray) -> np.ndarray:
            target_size = self.get_preprocess_shape(image.shape[0], image.shape[1], self.target_length)
            return np.array(resize(to_pil_image(image), target_size))

        @staticmethod
        def get_preprocess_shape(oldh: int, oldw: int, long_side_length: int):
            """
            Compute the output size given input size and target long side length.
            """
            scale = long_side_length * 1.0 / max(oldh, oldw)
            newh, neww = oldh * scale, oldw * scale
            neww = int(neww + 0.5)
            newh = int(newh + 0.5)
            return (newh, neww)


    resizer = ResizeLongestSide(1024)
    def preprocess_image(image: np.ndarray):
        resized_image = resizer.apply_image(image)            
        resized_image = (resized_image.astype(np.float32) - [123.675, 116.28, 103.53]) / [58.395, 57.12, 57.375]
        resized_image = np.expand_dims(np.transpose(resized_image, (2, 0, 1)).astype(np.float32), 0)
        h, w = resized_image.shape[-2:]
        padh = 1024 - h
        padw = 1024 - w            
        x = np.pad(resized_image, ((0, 0), (0, 0), (0, padh), (0, padw)))
        return x
    

    class COCOLoader(data.Dataset):
        def __init__(self, images_path):
            self.images = list(Path(images_path).iterdir())
        def __getitem__(self, index):
            image_path = self.images[index]
            image = cv2.imread(str(image_path))
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            image=np.squeeze(preprocess_image(np.squeeze(image)))
            return image

        def __len__(self):
            return len(self.images)

    
    import nncf
    def transform_fn(image_data):
        image = image_data.numpy()
        return image

    coco_dataset = COCOLoader('../../datasets/coco/images/val2017')
    calibration_loader = torch.utils.data.DataLoader(coco_dataset,batch_size=1)
    calibration_dataset = nncf.Dataset(calibration_loader, transform_fn)
    ov_encoder_model=ov.Core().read_model("../../models/public/mobile_sam/FP16/mobile_sam_1_3_1024_1024.xml")
    quantized_model = nncf.quantize(ov_encoder_model,
                                calibration_dataset,
                                model_type=nncf.parameters.ModelType.TRANSFORMER)
    ov.save_model(quantized_model, "../../models/public/mobile_sam/FP16-INT8/mobile_sam_1_3_1024_1024.xml")   
    del quantized_model,ov_encoder_model,coco_dataset

    coco_dataset = COCOLoader('../../datasets/coco/images/val2017')
    ov_encoder_model=ov.Core().read_model("../../models/public/mobile_sam/FP16/mobile_sam_4_3_1024_1024.xml")
    calibration_loader = torch.utils.data.DataLoader(coco_dataset,batch_size=4)
    calibration_dataset = nncf.Dataset(calibration_loader, transform_fn)
    quantized_model = nncf.quantize(ov_encoder_model,
                                calibration_dataset,
                                subset_size=64,
                                model_type=nncf.parameters.ModelType.TRANSFORMER)
    ov.save_model(quantized_model, "../../models/public/mobile_sam/FP16-INT8/mobile_sam_4_3_1024_1024.xml") 




def main():
    parser = argparse.ArgumentParser("convert int8")
    parser.add_argument('--model', type=str, help='select model type,such as yolo')
    parser.add_argument('--input', type=str, help='input model dir')
    parser.add_argument('--output', type=str, help='output model dir')
    parser.add_argument('--batch', type=int, help='img batch')
    parser.add_argument('--size', nargs='+', type=int, default=[640, 640], help='image (h, w)')
    parser.add_argument('--channels', type=str, help='NCHW or NHWC')
    args = parser.parse_args()

    model_type=args.model
    _input_model_path=args.input
    _output_model_path=args.output
    _batch=args.batch
    _size=args.size
    _channels=args.channels

    if model_type=="yolo":
        yolo(_input_model_path,_output_model_path,_batch,_size,_channels)
    if model_type=="sam":
        sam()
    if model_type=="mobile_sam":
        mobile_sam()        
    if model_type=="mobilevit_onnx":
        mobilevit_onnx()    
    if model_type=="mobilevit_ir":
        mobilevit_ir()     
if __name__=="__main__":
    main()
