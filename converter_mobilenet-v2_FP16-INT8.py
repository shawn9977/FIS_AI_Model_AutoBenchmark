
import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms

model = ov.Core().read_model("./models/public/mobilenet-v2/FP16/mobilenet-v2.xml")
val_dataset = datasets.ImageFolder(
    "./datasets/imagenet/val",
    transform=transforms.Compose([transforms.Resize([224, 224]), transforms.ToTensor()]))


dataset_loader = torch.utils.data.DataLoader( val_dataset, batch_size=1 )

def transform_fn(data_item):
    images, _ = data_item
    return images

calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
quantized_model = nncf.quantize(
    model,
    calibration_dataset)

from openvino.runtime import serialize
int8_model_path = "./models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml"
serialize(quantized_model, int8_model_path)

int8_model_path = "./models/public/mobilenet-v2/FP16-INT8_Batch4/mobilenet-v2.xml"
quantized_model.reshape([4,3,224,224])
serialize(quantized_model, int8_model_path)
