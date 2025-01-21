#!/usr/bin/env bash

python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=models/public/swin-tiny-patch4-window7-224 \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/swin-tiny-patch4-window7-224 \
    --model-name=create_model \
    --import-module=model \
    '--model-param=weights=r"models/public/swin-tiny-patch4-window7-224/swin_tiny_patch4_window7_224.pth"' \
    --input-shape=1,3,224,224 \
    --input-names=input \
    --output-names=probs \
    --output-file=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224.onnx

mo \
    --framework=onnx \
    --output_dir=models/public/swin-tiny-patch4-window7-224/FP16 \
    --model_name=swin-tiny-patch4-window7-224 \
    --input=input \
    --input_model=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=probs \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True

mo \
    --framework=onnx \
    --output_dir=models/public/swin-tiny-patch4-window7-224/FP32 \
    --model_name=swin-tiny-patch4-window7-224 \
    --input=input \
    --input_model=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=probs \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=False



python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=models/public/swin-tiny-patch4-window7-224 \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/swin-tiny-patch4-window7-224 \
    --model-name=create_model \
    --import-module=model \
    '--model-param=weights=r"models/public/swin-tiny-patch4-window7-224/swin_tiny_patch4_window7_224.pth"' \
    --input-shape=4,3,224,224 \
    --input-names=input \
    --output-names=probs \
    --output-file=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224_batch4.onnx


mo \
    --framework=onnx \
    --output_dir=models/public/swin-tiny-patch4-window7-224/FP16_Batch4 \
    --model_name=swin-tiny-patch4-window7-224 \
    --input=input \
    --input_model=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224_batch4.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=probs \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True


mo \
    --framework=onnx \
    --output_dir=models/public/swin-tiny-patch4-window7-224/FP32_Batch4 \
    --model_name=swin-tiny-patch4-window7-224 \
    --input=input \
    --input_model=models/public/swin-tiny-patch4-window7-224/swin-tiny-patch4-window7-224_batch4.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=probs \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=False



python converter_swin_tiny_patch4_window7_224_FP16-INT8.py

python converter_swin_tiny_patch4_window7_224_FP16-INT8_Batch4.py











