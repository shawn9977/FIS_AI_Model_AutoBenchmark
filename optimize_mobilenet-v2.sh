#!/usr/bin/env bash


mo \
    --framework=caffe \
    --output_dir=models/public/mobilenet-v2/FP16 \
    --model_name=mobilenet-v2 --input=data \
    '--mean_values=data[103.94,116.78,123.68]' \
    '--scale_values=data[58.8235294117647]' \
    --output=prob \
    --input_model=models/public/mobilenet-v2/mobilenet-v2.caffemodel \
    --input_proto=models/public/mobilenet-v2/mobilenet-v2.prototxt \
    '--layout=data(NCHW)' \
    '--input_shape=[1, 3, 224, 224]' \
    --compress_to_fp16=True

# mo \
#     --framework=caffe \
#     --output_dir=models/public/mobilenet-v2/FP32 \
#     --model_name=mobilenet-v2 \
#     --input=data \
#     '--mean_values=data[103.94,116.78,123.68]' \
#     '--scale_values=data[58.8235294117647]' \
#     --output=prob \
#     --input_model=models/public/mobilenet-v2/mobilenet-v2.caffemodel \
#     --input_proto=models/public/mobilenet-v2/mobilenet-v2.prototxt \
#     '--layout=data(NCHW)' \
#     '--input_shape=[1, 3, 224, 224]' \
#     --compress_to_fp16=True \
#     '--layout=data(NCHW)' \
#     '--input_shape=[1, 3, 224, 224]' \
#     --compress_to_fp16=False

mo \
    --framework=caffe \
    --output_dir=models/public/mobilenet-v2/FP16_Batch4 \
    --model_name=mobilenet-v2 \
    --input=data \
    '--mean_values=data[103.94,116.78,123.68]' \
    '--scale_values=data[58.8235294117647]' \
    --output=prob \
    --input_model=models/public/mobilenet-v2/mobilenet-v2.caffemodel \
    --input_proto=models/public/mobilenet-v2/mobilenet-v2.prototxt \
    '--layout=data(NCHW)' \
    '--input_shape=[4, 3, 224, 224]' \
    --compress_to_fp16=True

# mo \
#     --framework=caffe \
#     --output_dir=models/public/mobilenet-v2/FP32_Batch4 \
#     --model_name=mobilenet-v2 \
#     --input=data \
#     '--mean_values=data[103.94,116.78,123.68]' \
#     '--scale_values=data[58.8235294117647]' \
#     --output=prob \
#     --input_model=models/public/mobilenet-v2/mobilenet-v2.caffemodel \
#     --input_proto=models/public/mobilenet-v2/mobilenet-v2.prototxt \
#     '--layout=data(NCHW)' \
#     '--input_shape=[4, 3, 224, 224]' \
#     --compress_to_fp16=True \
#     '--layout=data(NCHW)' \
#     '--input_shape=[4, 3, 224, 224]' \
#     --compress_to_fp16=False



python3 converter_mobilenet-v2_FP16-INT8.py







