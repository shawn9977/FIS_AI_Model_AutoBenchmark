set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d CPU -hint throughput > results/fastseg-small_FP16-INT8_fastseg-small.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d CPU -hint latency > results/fastseg-small_FP16-INT8_fastseg-small.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.0 -hint throughput > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.0 -hint latency > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.1 -hint throughput > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.1 -hint latency > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d CPU -hint throughput > results/fastseg-small_FP16_fastseg-small.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d CPU -hint latency > results/fastseg-small_FP16_fastseg-small.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.0 -hint throughput > results/fastseg-small_FP16_fastseg-small.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.0 -hint latency > results/fastseg-small_FP16_fastseg-small.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.1 -hint throughput > results/fastseg-small_FP16_fastseg-small.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.1 -hint latency > results/fastseg-small_FP16_fastseg-small.xml__GPU_1__latency.txt
