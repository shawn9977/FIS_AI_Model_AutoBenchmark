#!/usr/bin/env bash

# Converting efficientnet-v2-b0 to ONNX
python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=models/public/efficientnet-v2-b0 \
    --model-name=tf_efficientnetv2_b0 \
    --import-module=timm.models.efficientnet \
    --weights=models/public/efficientnet-v2-b0/tf_efficientnetv2_b0-c7cc451f.pth \
    --input-shape=1,3,224,224 \
    --input-names=input \
    --output-names=logits \
    --output-file=models/public/efficientnet-v2-b0/efficientnet-v2-b0.onnx

# Converting efficientnet-v2-b0 to IR (FP16)
mo \
    --framework=onnx \
    --output_dir=models/public/efficientnet-v2-b0/FP16 \
    --model_name=efficientnet-v2-b0 \
    --input=input \
    --input_model=models/public/efficientnet-v2-b0/efficientnet-v2-b0.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=logits \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True


# Converting efficientnet-v2-b0 to IR (FP32)
mo \
    --framework=onnx \
    --output_dir=models/public/efficientnet-v2-b0/FP32 \
    --model_name=efficientnet-v2-b0 \
    --input=input \
    --input_model=models/public/efficientnet-v2-b0/efficientnet-v2-b0.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=logits \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=False




# Converting efficientnet-v2-b0 to ONNX
python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=models/public/efficientnet-v2-b0 \
    --model-name=tf_efficientnetv2_b0 \
    --import-module=timm.models.efficientnet \
    --weights=models/public/efficientnet-v2-b0/tf_efficientnetv2_b0-c7cc451f.pth \
    --input-shape=4,3,224,224 \
    --input-names=input \
    --output-names=logits \
    --output-file=models/public/efficientnet-v2-b0/efficientnet-v2-b0_batch4.onnx

# Converting efficientnet-v2-b0 to IR (FP16)
mo \
    --framework=onnx \
    --output_dir=models/public/efficientnet-v2-b0/FP16_Batch4 \
    --model_name=efficientnet-v2-b0 \
    --input=input \
    --input_model=models/public/efficientnet-v2-b0/efficientnet-v2-b0_batch4.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=logits \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True

# Converting efficientnet-v2-b0 to IR (FP32)
mo \
    --framework=onnx \
    --output_dir=models/public/efficientnet-v2-b0/FP32_Batch4 \
    --model_name=efficientnet-v2-b0 \
    --input=input \
    --input_model=models/public/efficientnet-v2-b0/efficientnet-v2-b0_batch4.onnx \
    '--mean_values=input[123.675,116.28,103.53]' \
    '--scale_values=input[58.395,57.12,57.375]' \
    --reverse_input_channels \
    --output=logits \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True \
    '--layout=input(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=False



python converter_efficientnet-v2-b0_FP16-INT8.py







