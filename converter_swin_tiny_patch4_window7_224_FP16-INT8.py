
import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms

model = ov.Core().read_model("./models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml")
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
int8_model_path = "./models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml"
serialize(quantized_model, int8_model_path)


# int8_model_path = "./models/public/swin-tiny-patch4-window7-224/FP16-INT8_Batch4/swin-tiny-patch4-window7-224.xml"
# quantized_model.reshape([4,3,224,224])
# serialize(quantized_model, int8_model_path)


