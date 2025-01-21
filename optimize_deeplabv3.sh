#!/usr/bin/env bash



# Converting deeplabv3 to IR (FP16)
mo \
    --framework=tf \
    --output_dir=models/public/deeplabv3/FP16 \
    --model_name=deeplabv3 \
    --input=1:mul_1 \
    --reverse_input_channels \
    --output=ArgMax \
    --input_model=models/public/deeplabv3/deeplabv3_mnv2_pascal_train_aug/frozen_inference_graph.pb \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[1, 513, 513, 3]' \
    --compress_to_fp16=True


# Converting deeplabv3 to IR (FP32)
mo \
    --framework=tf \
    --output_dir=models/public/deeplabv3/FP32 \
    --model_name=deeplabv3 \
    --input=1:mul_1 \
    --reverse_input_channels \
    --output=ArgMax \
    --input_model=models/public/deeplabv3/deeplabv3_mnv2_pascal_train_aug/frozen_inference_graph.pb \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[1, 513, 513, 3]' \
    --compress_to_fp16=True \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[1, 513, 513, 3]' \
    --compress_to_fp16=False



# Converting deeplabv3 to IR (FP16)
mo \
    --framework=tf \
    --output_dir=models/public/deeplabv3/FP16_Batch4 \
    --model_name=deeplabv3 \
    --input=1:mul_1 \
    --reverse_input_channels \
    --output=ArgMax \
    --input_model=models/public/deeplabv3/deeplabv3_mnv2_pascal_train_aug/frozen_inference_graph.pb \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[4, 513, 513, 3]' \
    --compress_to_fp16=True


# Converting deeplabv3 to IR (FP32)
mo \
    --framework=tf \
    --output_dir=models/public/deeplabv3/FP32_Batch4 \
    --model_name=deeplabv3 \
    --input=1:mul_1 \
    --reverse_input_channels \
    --output=ArgMax \
    --input_model=models/public/deeplabv3/deeplabv3_mnv2_pascal_train_aug/frozen_inference_graph.pb \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[4, 513, 513, 3]' \
    --compress_to_fp16=True \
    '--layout=1:mul_1(NHWC)' \
    '--input_shape=[4, 513, 513, 3]' \
    --compress_to_fp16=False





python converter_deeplabv3_FP16-INT8.py







