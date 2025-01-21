time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
