#!/usr/bin/env bash

python -- \
    ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/fastseg-large \
    --model-path=models/public/fastseg-large/model \
    --model-name=fastseg_large \
    --import-module=model \
    '--model-param=weights_path=r"models/public/fastseg-large/mobilev3large-lraspp-f128-9cbabfde.pt"' \
    --input-shapes=1,3,1024,2048 \
    --input-names=input0 \
    --output-names=output0 \
    --output-file=models/public/fastseg-large/fastseg-large.onnx

mo \
    --framework=onnx \
    --output_dir=models/public/fastseg-large/FP16 \
    --model_name=fastseg-large \
    --input=input0 \
    --reverse_input_channels \
    --output=output0 \
    '--mean_values=[123.675,116.28,103.53]' \
    '--scale_values=[58.395,57.12,57.375]' \
    --input_model=models/public/fastseg-large/fastseg-large.onnx \
    '--layout=input0(NCHW)' \
    '--input_shape=[1, 3, 1024, 2048]' \
    --compress_to_fp16=True

# mo \
#     --framework=onnx \
#     --output_dir=models/public/fastseg-large/FP32 \
#     --model_name=fastseg-large \
#     --input=input0 \
#     --reverse_input_channels \
#     --output=output0 \
#     '--mean_values=[123.675,116.28,103.53]' \
#     '--scale_values=[58.395,57.12,57.375]' \
#     --input_model=models/public/fastseg-large/fastseg-large.onnx \
#     '--layout=input0(NCHW)' \
#     '--input_shape=[1, 3, 1024, 2048]' \
#     --compress_to_fp16=True \
#     '--layout=input0(NCHW)' \
#     '--input_shape=[1, 3, 1024, 2048]' \
#     --compress_to_fp16=False


python -- \
    ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/internal_scripts/pytorch_to_onnx.py \
    --model-path=./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/fastseg-large \
    --model-path=models/public/fastseg-large/model \
    --model-name=fastseg_large \
    --import-module=model \
    '--model-param=weights_path=r"models/public/fastseg-large/mobilev3large-lraspp-f128-9cbabfde.pt"' \
    --input-shapes=4,3,1024,2048 \
    --input-names=input0 \
    --output-names=output0 \
    --output-file=models/public/fastseg-large/fastseg-large_batch4.onnx

mo \
    --framework=onnx \
    --output_dir=models/public/fastseg-large/FP16_Batch4 \
    --model_name=fastseg-large \
    --input=input0 \
    --reverse_input_channels \
    --output=output0 \
    '--mean_values=[123.675,116.28,103.53]' \
    '--scale_values=[58.395,57.12,57.375]' \
    --input_model=models/public/fastseg-large/fastseg-large_batch4.onnx \
    '--layout=input0(NCHW)' \
    '--input_shape=[4, 3, 1024, 2048]' \
    --compress_to_fp16=True

# mo \
#     --framework=onnx \
#     --output_dir=models/public/fastseg-large/FP32_Batch4 \
#     --model_name=fastseg-large \
#     --input=input0 \
#     --reverse_input_channels \
#     --output=output0 \
#     '--mean_values=[123.675,116.28,103.53]' \
#     '--scale_values=[58.395,57.12,57.375]' \
#     --input_model=models/public/fastseg-large/fastseg-large_batch4.onnx \
#     '--layout=input0(NCHW)' \
#     '--input_shape=[4, 3, 1024, 2048]' \
#     --compress_to_fp16=True \
#     '--layout=input0(NCHW)' \
#     '--input_shape=[4, 3, 1024, 2048]' \
#     --compress_to_fp16=False



python converter_fastseg-large_FP16-INT8.py




