time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP32/mask_rcnn_resnet50_atrous_coco.xml -infer_precision f32 -d GPU.1 -hint throughput > results/mask_rcnn_resnet50_atrous_coco_FP32_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP32/mask_rcnn_resnet50_atrous_coco.xml -infer_precision f32 -d GPU.1 -hint latency > results/mask_rcnn_resnet50_atrous_coco_FP32_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP16/mask_rcnn_resnet50_atrous_coco.xml -d GPU.1 -hint throughput > results/mask_rcnn_resnet50_atrous_coco_FP16_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP16/mask_rcnn_resnet50_atrous_coco.xml -d GPU.1 -hint latency > results/mask_rcnn_resnet50_atrous_coco_FP16_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP16-INT8/mask_rcnn_resnet50_atrous_coco.xml -d GPU.1 -hint throughput > results/mask_rcnn_resnet50_atrous_coco_FP16-INT8_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mask_rcnn_resnet50_atrous_coco/FP16-INT8/mask_rcnn_resnet50_atrous_coco.xml -d GPU.1 -hint latency > results/mask_rcnn_resnet50_atrous_coco_FP16-INT8_mask_rcnn_resnet50_atrous_coco.xml__GPU_1__latency.txt
