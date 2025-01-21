set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d CPU -hint throughput > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d CPU -hint latency > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d GPU.0 -hint throughput > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d GPU.0 -hint latency > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d GPU.1 -hint throughput > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP32/swin-tiny-patch4-window7-224.xml -infer_precision f32 -d GPU.1 -hint latency > results/swin-tiny-patch4-window7-224_FP32_swin-tiny-patch4-window7-224.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d CPU -hint throughput > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d CPU -hint latency > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d GPU.0 -hint throughput > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d GPU.0 -hint latency > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d GPU.1 -hint throughput > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16/swin-tiny-patch4-window7-224.xml -d GPU.1 -hint latency > results/swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d CPU -hint throughput > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d CPU -hint latency > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d GPU.0 -hint throughput > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d GPU.0 -hint latency > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d GPU.1 -hint throughput > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/swin-tiny-patch4-window7-224/FP16-INT8/swin-tiny-patch4-window7-224.xml -d GPU.1 -hint latency > results/swin-tiny-patch4-window7-224_FP16-INT8_swin-tiny-patch4-window7-224.xml__GPU_1__latency.txt
