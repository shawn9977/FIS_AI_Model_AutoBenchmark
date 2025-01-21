time /T
benchmark_app -m models/public/mobile_sam/FP32/mobile_sam_1_3_1024_1024.xml -infer_precision f32 -d GPU.1 -hint throughput > results/mobile_sam_FP32_mobile_sam_1_3_1024_1024.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobile_sam/FP32/mobile_sam_1_3_1024_1024.xml -infer_precision f32 -d GPU.1 -hint latency > results/mobile_sam_FP32_mobile_sam_1_3_1024_1024.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobile_sam/FP16/mobile_sam_1_3_1024_1024.xml -d GPU.1 -hint throughput > results/mobile_sam_FP16_mobile_sam_1_3_1024_1024.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobile_sam/FP16/mobile_sam_1_3_1024_1024.xml -d GPU.1 -hint latency > results/mobile_sam_FP16_mobile_sam_1_3_1024_1024.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobile_sam/FP16-INT8/mobile_sam_1_3_1024_1024.xml -d GPU.1 -hint throughput > results/mobile_sam_FP16-INT8_mobile_sam_1_3_1024_1024.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobile_sam/FP16-INT8/mobile_sam_1_3_1024_1024.xml -d GPU.1 -hint latency > results/mobile_sam_FP16-INT8_mobile_sam_1_3_1024_1024.xml__GPU_1__latency.txt
