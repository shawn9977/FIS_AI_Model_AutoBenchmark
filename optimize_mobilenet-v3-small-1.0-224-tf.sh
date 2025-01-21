#!/usr/bin/env bash




python \
    -- ./openvino_env/lib/python3.10/site-packages/openvino/model_zoo/models/public/mobilenet-v3-small-1.0-224-tf/pre-convert.py \
    -- models/public/mobilenet-v3-small-1.0-224-tf models/public/mobilenet-v3-small-1.0-224-tf

mo \
    --framework=tf \
    --output_dir=models/public/mobilenet-v3-small-1.0-224-tf/FP16 \
    --model_name=mobilenet-v3-small-1.0-224-tf \
    --input=input_1 \
    --reverse_input_channels \
    --saved_model_dir=models/public/mobilenet-v3-small-1.0-224-tf/mobilenet_v3_small_224_1.0_float.savedmodel \
    '--layout=input_1(NHWC)' \
    '--input_shape=[1, 224, 224, 3]' \
    --compress_to_fp16=True

mo \
    --framework=tf \
    --output_dir=models/public/mobilenet-v3-small-1.0-224-tf/FP16_Batch4 \
    --model_name=mobilenet-v3-small-1.0-224-tf \
    --input=input_1 \
    --reverse_input_channels \
    --saved_model_dir=models/public/mobilenet-v3-small-1.0-224-tf/mobilenet_v3_small_224_1.0_float.savedmodel \
    '--layout=input_1(NHWC)' \
    '--input_shape=[4, 224, 224, 3]' \
    --compress_to_fp16=True


# mo \
#     --framework=tf \
#     --output_dir=models/public/mobilenet-v3-small-1.0-224-tf/FP32 \
#     --model_name=mobilenet-v3-small-1.0-224-tf \
#     --input=input_1 \
#     --reverse_input_channels \
#     --saved_model_dir=models/public/mobilenet-v3-small-1.0-224-tf/mobilenet_v3_small_224_1.0_float.savedmodel \
#     '--layout=input_1(NHWC)' \
#     '--input_shape=[1, 224, 224, 3]' \
#     --compress_to_fp16=True \
#     '--layout=input_1(NHWC)' \
#     '--input_shape=[1, 224, 224, 3]' \
#     --compress_to_fp16=False

# mo \
#     --framework=tf \
#     --output_dir=models/public/mobilenet-v3-small-1.0-224-tf/FP32_Batch4 \
#     --model_name=mobilenet-v3-small-1.0-224-tf \
#     --input=input_1 \
#     --reverse_input_channels \
#     --saved_model_dir=models/public/mobilenet-v3-small-1.0-224-tf/mobilenet_v3_small_224_1.0_float.savedmodel \
#     '--layout=input_1(NHWC)' \
#     '--input_shape=[4, 224, 224, 3]' \
#     --compress_to_fp16=True \
#     '--layout=input_1(NHWC)' \
#     '--input_shape=[4, 224, 224, 3]' \
#     --compress_to_fp16=False



python3 converter_mobilenet-v3-small-1.0-224-tf_FP16-INT8.py



