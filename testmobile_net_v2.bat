time /T
benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.1 -hint throughput > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.1 -hint latency > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.1 -hint throughput > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.1 -hint latency > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_1__latency.txt
