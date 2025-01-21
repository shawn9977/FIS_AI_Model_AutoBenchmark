set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d CPU -hint throughput > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d CPU -hint latency > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d GPU.0 -hint throughput > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d GPU.0 -hint latency > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d GPU.1 -hint throughput > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16-INT8/sam_1_1024_1024_3.xml -d GPU.1 -hint latency > results/sam_FP16-INT8_sam_1_1024_1024_3.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d CPU -hint throughput > results/sam_FP16_sam_1_1024_1024_3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d CPU -hint latency > results/sam_FP16_sam_1_1024_1024_3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d GPU.0 -hint throughput > results/sam_FP16_sam_1_1024_1024_3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d GPU.0 -hint latency > results/sam_FP16_sam_1_1024_1024_3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d GPU.1 -hint throughput > results/sam_FP16_sam_1_1024_1024_3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/sam/FP16/sam_1_1024_1024_3.xml -d GPU.1 -hint latency > results/sam_FP16_sam_1_1024_1024_3.xml__GPU_1__latency.txt
