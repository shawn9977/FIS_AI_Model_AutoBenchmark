#!/usr/bin/env bash

python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-name=resnet50 \
    --weights=models/public/resnet-50-pytorch/resnet50-19c8e357.pth \
    --import-module=torchvision.models \
    --input-shape=1,3,224,224 \
    --output-file=models/public/resnet-50-pytorch/resnet-v1-50.onnx \
    --input-names=data \
    --output-names=prob


mo \
    --framework=onnx \
    --output_dir=models/public/resnet-50-pytorch/FP16 \
    --model_name=resnet-50-pytorch \
    --input=data \
    '--mean_values=data[123.675,116.28,103.53]' \
    '--scale_values=data[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=prob \
    --input_model=models/public/resnet-50-pytorch/resnet-v1-50.onnx \
    '--layout=data(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True

# mo \
#     --framework=onnx \
#     --output_dir=models/public/resnet-50-pytorch/FP32 \
#     --model_name=resnet-50-pytorch \
#     --input=data \
#     '--mean_values=data[123.675,116.28,103.53]' \
#     '--scale_values=data[58.395,57.12,57.375]' \
#     --reverse_input_channels \
#     --output=prob \
#     --input_model=models/public/resnet-50-pytorch/resnet-v1-50.onnx \
#     '--layout=data(NCHW)' \
#     '--input_shape=[1, 3, 224, 224]' \
#     --compress_to_fp16=True \
#     '--layout=data(NCHW)' \
#     '--input_shape=[1, 3, 224, 224]' \
#     --compress_to_fp16=False



python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-name=resnet50 \
    --weights=models/public/resnet-50-pytorch/resnet50-19c8e357.pth \
    --import-module=torchvision.models \
    --input-shape=4,3,224,224 \
    --output-file=models/public/resnet-50-pytorch/resnet-v1-50_batch4.onnx \
    --input-names=data \
    --output-names=prob


mo \
    --framework=onnx \
    --output_dir=models/public/resnet-50-pytorch/FP16_Batch4 \
    --model_name=resnet-50-pytorch \
    --input=data \
    '--mean_values=data[123.675,116.28,103.53]' \
    '--scale_values=data[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=prob \
    --input_model=models/public/resnet-50-pytorch/resnet-v1-50_batch4.onnx \
    '--layout=data(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True


# mo \
#     --framework=onnx \
#     --output_dir=models/public/resnet-50-pytorch/FP32_Batch4 \
#     --model_name=resnet-50-pytorch \
#     --input=data \
#     '--mean_values=data[123.675,116.28,103.53]' \
#     '--scale_values=data[58.395,57.12,57.375]' \
#     --reverse_input_channels \
#     --output=prob \
#     --input_model=models/public/resnet-50-pytorch/resnet-v1-50_batch4.onnx \
#     '--layout=data(NCHW)' \
#     '--input_shape=[4, 3, 224, 224]' \
#     --compress_to_fp16=True \
#     '--layout=data(NCHW)' \
#     '--input_shape=[4, 3, 224, 224]' \
#     --compress_to_fp16=False



python converter_resnet-50-pytorch_FP16-INT8.py




