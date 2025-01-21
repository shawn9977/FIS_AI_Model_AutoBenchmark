set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d CPU -hint throughput > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d CPU -hint latency > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.0 -hint throughput > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.0 -hint latency > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP32/faster_rcnn_resnet50_coco.xml -infer_precision f32 -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP32_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d CPU -hint throughput > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d CPU -hint latency > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.0 -hint throughput > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.0 -hint latency > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP16_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d CPU -hint throughput > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d CPU -hint latency > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.0 -hint throughput > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.0 -hint latency > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint throughput > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/faster_rcnn_resnet50_coco/FP16-INT8/faster_rcnn_resnet50_coco.xml -d GPU.1 -hint latency > results/faster_rcnn_resnet50_coco_FP16-INT8_faster_rcnn_resnet50_coco.xml__GPU_1__latency.txt
