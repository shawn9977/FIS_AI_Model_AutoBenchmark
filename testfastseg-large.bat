time /T
benchmark_app -m models/public/fastseg-large/FP16-INT8/fastseg-large.xml -d GPU.1 -hint throughput > results/fastseg-large_FP16-INT8_fastseg-large.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/fastseg-large/FP16-INT8/fastseg-large.xml -d GPU.1 -hint latency > results/fastseg-large_FP16-INT8_fastseg-large.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/fastseg-large/FP16/fastseg-large.xml -d GPU.1 -hint throughput > results/fastseg-large_FP16_fastseg-large.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/fastseg-large/FP16/fastseg-large.xml -d GPU.1 -hint latency > results/fastseg-large_FP16_fastseg-large.xml__GPU_1__latency.txt
