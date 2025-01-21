#!/usr/bin/env bash


mo \
    --framework=tf \
    --output_dir=models/public/mask_rcnn_resnet50_atrous_coco/FP16 \
    --model_name=mask_rcnn_resnet50_atrous_coco \
    --input=image_tensor \
    --reverse_input_channels \
    --transformations_config=./openvino_env/lib/python3.10/site-packages/openvino/tools/mo/front/tf/mask_rcnn_support.json \
    --tensorflow_object_detection_api_pipeline_config=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/pipeline.config \
    --input_model=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/frozen_inference_graph.pb \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[1, 800, 800, 3]' \
    --compress_to_fp16=True



mo \
    --framework=tf \
    --output_dir=models/public/mask_rcnn_resnet50_atrous_coco/FP32 \
    --model_name=mask_rcnn_resnet50_atrous_coco \
    --input=image_tensor \
    --reverse_input_channels \
    --transformations_config=./openvino_env/lib/python3.10/site-packages/openvino/tools/mo/front/tf/mask_rcnn_support.json \
    --tensorflow_object_detection_api_pipeline_config=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/pipeline.config \
    --input_model=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/frozen_inference_graph.pb \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[1, 800, 800, 3]' \
    --compress_to_fp16=True \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[1, 800, 800, 3]' \
    --compress_to_fp16=False



mo \
    --framework=tf \
    --output_dir=models/public/mask_rcnn_resnet50_atrous_coco/FP16_Batch4 \
    --model_name=mask_rcnn_resnet50_atrous_coco \
    --input=image_tensor \
    --reverse_input_channels \
    --transformations_config=./openvino_env/lib/python3.10/site-packages/openvino/tools/mo/front/tf/mask_rcnn_support.json \
    --tensorflow_object_detection_api_pipeline_config=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/pipeline.config \
    --input_model=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/frozen_inference_graph.pb \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[4, 800, 800, 3]' \
    --compress_to_fp16=True



mo \
    --framework=tf \
    --output_dir=models/public/mask_rcnn_resnet50_atrous_coco/FP32_Batch4 \
    --model_name=mask_rcnn_resnet50_atrous_coco \
    --input=image_tensor \
    --reverse_input_channels \
    --transformations_config=./openvino_env/lib/python3.10/site-packages/openvino/tools/mo/front/tf/mask_rcnn_support.json \
    --tensorflow_object_detection_api_pipeline_config=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/pipeline.config \
    --input_model=models/public/mask_rcnn_resnet50_atrous_coco/mask_rcnn_resnet50_atrous_coco_2018_01_28/frozen_inference_graph.pb \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[4, 800, 800, 3]' \
    --compress_to_fp16=True \
    '--layout=image_tensor(NHWC)' \
    '--input_shape=[4, 800, 800, 3]' \
    --compress_to_fp16=False




# converter fails Model expects 2 inputs, but 1 are provided.


python converter_maskrcnn_resnet50_fpn_v2_coco_FP16-INT8.py

