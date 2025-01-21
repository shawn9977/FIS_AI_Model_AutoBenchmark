time /T
benchmark_app -m models/public/detr-resnet50/FP32/detr-resnet50.xml -infer_precision f32 -d GPU.1 -hint throughput > results/detr-resnet50_FP32_detr-resnet50.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/detr-resnet50/FP32/detr-resnet50.xml -infer_precision f32 -d GPU.1 -hint latency > results/detr-resnet50_FP32_detr-resnet50.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/detr-resnet50/FP16/detr-resnet50.xml -d GPU.1 -hint throughput > results/detr-resnet50_FP16_detr-resnet50.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/detr-resnet50/FP16/detr-resnet50.xml -d GPU.1 -hint latency > results/detr-resnet50_FP16_detr-resnet50.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/detr-resnet50/FP16-INT8/detr-resnet50.xml -d GPU.1 -hint throughput > results/detr-resnet50_FP16-INT8_detr-resnet50.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/detr-resnet50/FP16-INT8/detr-resnet50.xml -d GPU.1 -hint latency > results/detr-resnet50_FP16-INT8_detr-resnet50.xml__GPU_1__latency.txt
