time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP32/efficientnet-v2-b0.xml -infer_precision f32 -d GPU.1 -hint throughput > results/efficientnet-v2-b0_FP32_efficientnet-v2-b0.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP32/efficientnet-v2-b0.xml -infer_precision f32 -d GPU.1 -hint latency > results/efficientnet-v2-b0_FP32_efficientnet-v2-b0.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP16/efficientnet-v2-b0.xml -d GPU.1 -hint throughput > results/efficientnet-v2-b0_FP16_efficientnet-v2-b0.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP16/efficientnet-v2-b0.xml -d GPU.1 -hint latency > results/efficientnet-v2-b0_FP16_efficientnet-v2-b0.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP16-INT8/efficientnet-v2-b0.xml -d GPU.1 -hint throughput > results/efficientnet-v2-b0_FP16-INT8_efficientnet-v2-b0.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/efficientnet-v2-b0/FP16-INT8/efficientnet-v2-b0.xml -d GPU.1 -hint latency > results/efficientnet-v2-b0_FP16-INT8_efficientnet-v2-b0.xml__GPU_1__latency.txt
