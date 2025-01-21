time /T
benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.1 -hint throughput > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/fastseg-small/FP16-INT8/fastseg-small.xml -d GPU.1 -hint latency > results/fastseg-small_FP16-INT8_fastseg-small.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.1 -hint throughput > results/fastseg-small_FP16_fastseg-small.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/fastseg-small/FP16/fastseg-small.xml -d GPU.1 -hint latency > results/fastseg-small_FP16_fastseg-small.xml__GPU_1__latency.txt
