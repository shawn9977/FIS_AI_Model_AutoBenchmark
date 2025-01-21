import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms

model = ov.Core().read_model("./models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml")
val_dataset = datasets.CocoDetection(
    root="./datasets/coco/images/val2017",
    annFile="./datasets/coco/annotations/instances_val2017.json",
    transform=transforms.Compose([transforms.Resize([800, 800]), transforms.ToTensor()]))
dataset_loader = torch.utils.data.DataLoader(val_dataset, batch_size=1)

def transform_fn(data_item):
    images, _ = data_item
    images = images.transpose(1,2).transpose(2,3)
    return images, torch.tensor([[800,800,1]])

calibration_dataset = nncf.Dataset(dataset_loader, transform_fn)
quantized_model = nncf.quantize(
    model,
    calibration_dataset)

from openvino.runtime import serialize
int8_model_path = "./models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml"
serialize(quantized_model, int8_model_path)



int8_model_path = "./models/public/faster_rcnn_resnet50_coco/FP16-INT8_Batch4/faster_rcnn_resnet50_coco.xml"
quantized_model.reshape({ 0:[4,800,800,3] })
serialize(quantized_model, int8_model_path)
