import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms

model = ov.Core().read_model("./models/public/mask_rcnn_resnet50_atrous_coco/FP16/mask_rcnn_resnet50_atrous_coco.xml")
val_dataset = datasets.CocoDetection(
    root="./datasets/coco/images/val2017",
    annFile="./datasets/coco/annotations/instances_val2017.json",
    transform=transforms.Compose([transforms.Resize([800, 800]), transforms.ToTensor()]))
dataset_loader = torch.utils.data.DataLoader(val_dataset, batch_size=1)

def transform_fn(data_item):
    images, _ = data_item
    images = images.transpose(1,2).transpose(2,3)
    # print(type(images))
    # print(images.shape)
    # mask rcnn 需要两个输入，第一个是图片，第二个是包含 image_info 的 tensor
    # Information of input image size, name: image_info, shape: 1, 3, format: B, C, where:
    #    B - batch size
    #    C - vector of 3 values in format H, W, S, where H is an image height, W is an image width, S is an image scale factor (usually 1)
    return images, torch.tensor([[800,800,1]])

calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
quantized_model = nncf.quantize(
    model,
    calibration_dataset)

from openvino.runtime import serialize
int8_model_path = "./models/public/mask_rcnn_resnet50_atrous_coco/FP16-INT8/mask_rcnn_resnet50_atrous_coco.xml"
serialize(quantized_model, int8_model_path)


int8_model_path = "./models/public/mask_rcnn_resnet50_atrous_coco/FP16-INT8_Batch4/mask_rcnn_resnet50_atrous_coco.xml"
quantized_model.reshape({ 0:[4,800,800,3] })
serialize(quantized_model, int8_model_path)
