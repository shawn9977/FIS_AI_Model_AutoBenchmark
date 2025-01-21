time /T
benchmark_app -m models/public/mobilevit/FP32/mobilevit_1_3_224_224.xml -infer_precision f32 -d GPU.1 -hint throughput > results/mobilevit_FP32_mobilevit_1_3_224_224.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilevit/FP32/mobilevit_1_3_224_224.xml -infer_precision f32 -d GPU.1 -hint latency > results/mobilevit_FP32_mobilevit_1_3_224_224.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobilevit/FP16/mobilevit_1_3_224_224.xml -d GPU.1 -hint throughput > results/mobilevit_FP16_mobilevit_1_3_224_224.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilevit/FP16/mobilevit_1_3_224_224.xml -d GPU.1 -hint latency > results/mobilevit_FP16_mobilevit_1_3_224_224.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobilevit/FP16-INT8/mobilevit_1_3_224_224.xml -d GPU.1 -hint throughput > results/mobilevit_FP16-INT8_mobilevit_1_3_224_224.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilevit/FP16-INT8/mobilevit_1_3_224_224.xml -d GPU.1 -hint latency > results/mobilevit_FP16-INT8_mobilevit_1_3_224_224.xml__GPU_1__latency.txt
