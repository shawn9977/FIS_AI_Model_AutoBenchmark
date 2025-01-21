set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d CPU -hint throughput > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d CPU -hint latency > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.0 -hint throughput > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.0 -hint latency > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.1 -hint throughput > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16-INT8/mobilenet-v2.xml -d GPU.1 -hint latency > results/mobilenet-v2_FP16-INT8_mobilenet-v2.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d CPU -hint throughput > results/mobilenet-v2_FP16_mobilenet-v2.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d CPU -hint latency > results/mobilenet-v2_FP16_mobilenet-v2.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.0 -hint throughput > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.0 -hint latency > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.1 -hint throughput > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/mobilenet-v2/FP16/mobilenet-v2.xml -d GPU.1 -hint latency > results/mobilenet-v2_FP16_mobilenet-v2.xml__GPU_1__latency.txt
