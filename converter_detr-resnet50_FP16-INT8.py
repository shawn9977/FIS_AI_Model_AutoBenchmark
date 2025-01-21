
import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms

model = ov.Core().read_model("./models/public/detr-resnet50/FP16/detr-resnet50.xml")
val_dataset = datasets.ImageFolder(
    "./datasets/imagenet/val",
    transform=transforms.Compose([transforms.Resize([512, 512]), transforms.ToTensor()]))


dataset_loader = torch.utils.data.DataLoader( val_dataset, batch_size=1 )

def transform_fn(data_item):
    images, _ = data_item
    return images

calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
quantized_model = nncf.quantize(
    model,
    calibration_dataset)

from openvino.runtime import serialize
int8_model_path = "./models/public/detr-resnet50/FP16-INT8/detr-resnet50.xml"
serialize(quantized_model, int8_model_path)


# int8_model_path = "./models/public/detr-resnet50/FP16-INT8_Batch4/detr-resnet50.xml"
# quantized_model.reshape([4,3,512,512])
# serialize(quantized_model, int8_model_path)


