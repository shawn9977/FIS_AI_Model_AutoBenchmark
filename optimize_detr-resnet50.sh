#!/usr/bin/env bash


# Converting detr-resnet50 to ONNX
python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/detr-resnet50 \
    --model-path=models/public/detr-resnet50 \
    --model-name=create_model \
    --import-module=model \
    '--model-param=weights=r"models/public/detr-resnet50/detr-r50-e632da11.pth"' \
    --input-shapes=1,3,512,512 \
    --input-names=input \
    --output-names=scores,boxes \
    --output-file=models/public/detr-resnet50/detr-resnet50.onnx

# Converting detr-resnet50 to IR (FP16)
mo \
    --framework=onnx --output_dir=models/public/detr-resnet50/FP16 \
    --model_name=detr-resnet50 \
    --input=input \
    --reverse_input_channels \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --output=boxes,scores \
    --input_model=models/public/detr-resnet50/detr-resnet50.onnx \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 512, 512]' \
    --compress_to_fp16=True

# Converting detr-resnet50 to IR (FP32)
mo \
    --framework=onnx \
    --output_dir=models/public/detr-resnet50/FP32 \
    --model_name=detr-resnet50 \
    --input=input \
    --reverse_input_channels \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --output=boxes,scores \
    --input_model=models/public/detr-resnet50/detr-resnet50.onnx \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 512, 512]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 512, 512]' \
    --compress_to_fp16=False


# Converting detr-resnet50 to ONNX
python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/detr-resnet50 \
    --model-path=models/public/detr-resnet50 \
    --model-name=create_model \
    --import-module=model \
    '--model-param=weights=r"models/public/detr-resnet50/detr-r50-e632da11.pth"' \
    --input-shapes=4,3,512,512 \
    --input-names=input \
    --output-names=scores,boxes \
    --output-file=models/public/detr-resnet50/detr-resnet50_batch4.onnx

# Converting detr-resnet50 to IR (FP16)
mo \
    --framework=onnx \
    --output_dir=models/public/detr-resnet50/FP16_Batch4 \
    --model_name=detr-resnet50 \
    --input=input \
    --reverse_input_channels \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --output=boxes,scores \
    --input_model=models/public/detr-resnet50/detr-resnet50_batch4.onnx \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 512, 512]' \
    --compress_to_fp16=True

# Converting detr-resnet50 to IR (FP32)
mo \
    --framework=onnx \
    --output_dir=models/public/detr-resnet50/FP32_Batch4 \
    --model_name=detr-resnet50 \
    --input=input \
    --reverse_input_channels \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --output=boxes,scores \
    --input_model=models/public/detr-resnet50/detr-resnet50_batch4.onnx \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 512, 512]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 512, 512]' \
    --compress_to_fp16=False





python converter_detr-resnet50_FP16-INT8.py

python converter_detr-resnet50_FP16-INT8_Batch4.py

# change to one channel 1024,1024 failed
# RuntimeError: Given groups=1, weight of size [64, 3, 7, 7], expected input[1, 1, 1024, 1024] to have 3 channels, but got 1 channels instead





















