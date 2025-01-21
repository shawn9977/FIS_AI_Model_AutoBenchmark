set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d CPU -hint throughput > results/deeplabv3_FP32_deeplabv3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d CPU -hint latency > results/deeplabv3_FP32_deeplabv3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d GPU.0 -hint throughput > results/deeplabv3_FP32_deeplabv3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d GPU.0 -hint latency > results/deeplabv3_FP32_deeplabv3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d GPU.1 -hint throughput > results/deeplabv3_FP32_deeplabv3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP32/deeplabv3.xml -infer_precision f32 -d GPU.1 -hint latency > results/deeplabv3_FP32_deeplabv3.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d CPU -hint throughput > results/deeplabv3_FP16_deeplabv3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d CPU -hint latency > results/deeplabv3_FP16_deeplabv3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d GPU.0 -hint throughput > results/deeplabv3_FP16_deeplabv3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d GPU.0 -hint latency > results/deeplabv3_FP16_deeplabv3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d GPU.1 -hint throughput > results/deeplabv3_FP16_deeplabv3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16/deeplabv3.xml -d GPU.1 -hint latency > results/deeplabv3_FP16_deeplabv3.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d CPU -hint throughput > results/deeplabv3_FP16-INT8_deeplabv3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d CPU -hint latency > results/deeplabv3_FP16-INT8_deeplabv3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d GPU.0 -hint throughput > results/deeplabv3_FP16-INT8_deeplabv3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d GPU.0 -hint latency > results/deeplabv3_FP16-INT8_deeplabv3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d GPU.1 -hint throughput > results/deeplabv3_FP16-INT8_deeplabv3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/deeplabv3/FP16-INT8/deeplabv3.xml -d GPU.1 -hint latency > results/deeplabv3_FP16-INT8_deeplabv3.xml__GPU_1__latency.txt
