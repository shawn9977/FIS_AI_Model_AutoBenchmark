import nncf
import openvino.runtime as ov
import torch
from torchvision import datasets, transforms




from openvino.runtime import serialize

# FP16
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml"
model.reshape([1,3,512,512])
serialize(model, int8_model_path)

# FP16-INT8
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16-INT8/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml"
model.reshape([1,3,512,512])
serialize(model, int8_model_path)

# FP32
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP32/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml"
model.reshape([1,3,512,512])
serialize(model, int8_model_path)







# FP16_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,3,512,512])
serialize(model, int8_model_path)

# FP16-INT8_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16-INT8/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16-INT8_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,3,512,512])
serialize(model, int8_model_path)

# FP32_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP32/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP32_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,3,512,512])
serialize(model, int8_model_path)






# FP16_C1
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16_C1/unet-camvid-onnx-0001.xml"
model.reshape([1,1,512,512])
serialize(model, int8_model_path)

# FP16-INT8_C1
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16-INT8/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16-INT8_C1/unet-camvid-onnx-0001.xml"
model.reshape([1,1,512,512])
serialize(model, int8_model_path)

# FP32_C1
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP32/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP32_C1/unet-camvid-onnx-0001.xml"
model.reshape([1,1,512,512])
serialize(model, int8_model_path)







# FP16_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16_C1_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,1,512,512])
serialize(model, int8_model_path)

# FP16-INT8_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP16-INT8/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP16-INT8_C1_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,1,512,512])
serialize(model, int8_model_path)

# FP32_Batch4
model = ov.Core().read_model("./models/intel/unet-camvid-onnx-0001/FP32/unet-camvid-onnx-0001.xml")
int8_model_path = "./models/public/unet-camvid/FP32_C1_Batch4/unet-camvid-onnx-0001.xml"
model.reshape([4,1,512,512])
serialize(model, int8_model_path)








