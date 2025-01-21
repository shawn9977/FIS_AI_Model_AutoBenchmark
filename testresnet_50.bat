time /T
benchmark_app -m models/public/resnet-50-pytorch/FP16-INT8/resnet-50-pytorch.xml -d GPU.1 -hint throughput > results/resnet-50-pytorch_FP16-INT8_resnet-50-pytorch.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/resnet-50-pytorch/FP16-INT8/resnet-50-pytorch.xml -d GPU.1 -hint latency > results/resnet-50-pytorch_FP16-INT8_resnet-50-pytorch.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/resnet-50-pytorch/FP16/resnet-50-pytorch.xml -d GPU.1 -hint throughput > results/resnet-50-pytorch_FP16_resnet-50-pytorch.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/resnet-50-pytorch/FP16/resnet-50-pytorch.xml -d GPU.1 -hint latency > results/resnet-50-pytorch_FP16_resnet-50-pytorch.xml__GPU_1__latency.txt
