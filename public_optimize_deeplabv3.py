import torch

model = torch.hub.load('pytorch/vision:v0.10.0', 'deeplabv3_resnet50', pretrained=True)

model.eval()


# torch.onnx.export(model,               # model being run
#                   torch.randn(1, 3, 2048, 2048, requires_grad=True),  # model input (or a tuple for multiple inputs)
#                   "super_resolution.onnx",   # where to save the model (can be a file or file-like object)
#                   export_params=True,        # store the trained parameter weights inside the model file
#                   input_names = ['input'],   # the model's input names
#                   output_names = ['output'], # the model's output names
#                   dynamic_axes={'input' : {0 : 'batch_size',2:'height', 3:'width'},    # variable length axes
#                                 'output' : {0 : 'batch_size',2:'height', 3:'width'}}
#                                 )

import openvino as ov

ov_model=ov.convert_model(model,example_input=torch.randn(1,3,2048,2048))
ov.save_model(ov_model,"models/public/deeplabv3/FP16_2048/deeplabv3.xml",compress_to_fp16=True)
ov.save_model(ov_model,"models/public/deeplabv3/FP32_2048/deeplabv3.xml",compress_to_fp16=False)
