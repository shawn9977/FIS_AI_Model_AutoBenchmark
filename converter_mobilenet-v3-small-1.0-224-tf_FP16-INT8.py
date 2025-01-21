
import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms


model = ov.Core().read_model("./models/public/mobilenet-v3-small-1.0-224-tf/FP16/mobilenet-v3-small-1.0-224-tf.xml")
val_dataset = datasets.ImageFolder(
    "./datasets/imagenet/val",
    transform=transforms.Compose([transforms.Resize([224, 224]), transforms.ToTensor()]))


dataset_loader = torch.utils.data.DataLoader( val_dataset, batch_size=1 )
# dataset_loader = tfds.load( val_dataset, batch_size=1 )


def transform_fn(data_item):
    # print(len(data_item) )
    images, _ = data_item
    
    # [ GENERAL_ERROR ] Can't set input blob with name: input_1, 
    # because model input (shape=[1,224,224,3]) and blob (shape=(1.3.224.224)) are incompatible
    # 如果形状遇到形状不对的情况，需要置换通道
    images = images.transpose(1,3)

    return images

calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
quantized_model = nncf.quantize(
    model,
    calibration_dataset)

from openvino.runtime import serialize
int8_model_path = "./models/public/mobilenet-v3-small-1.0-224-tf/FP16-INT8/mobilenet-v3-small-1.0-224-tf.xml"
serialize(quantized_model, int8_model_path)

int8_model_path = "./models/public/mobilenet-v3-small-1.0-224-tf/FP16-INT8_Batch4/mobilenet-v3-small-1.0-224-tf.xml"
quantized_model.reshape([4,224,224,3])
serialize(quantized_model, int8_model_path)


