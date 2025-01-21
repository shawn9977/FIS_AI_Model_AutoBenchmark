time /T
benchmark_app -m models/public/yolov5/FP32/yolov5l_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov5_FP32_yolov5l_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP32/yolov5l_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov5_FP32_yolov5l_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/yolov5/FP32/yolov5l_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov5_FP32_yolov5l_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP32/yolov5l_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov5_FP32_yolov5l_1_3_640_640.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/yolov5/FP16/yolov5l_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov5_FP16_yolov5l_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP16/yolov5l_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov5_FP16_yolov5l_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/yolov5/FP16/yolov5l_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov5_FP16_yolov5l_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP16/yolov5l_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov5_FP16_yolov5l_1_3_640_640.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/yolov5/FP16-INT8/yolov5l_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov5_FP16-INT8_yolov5l_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP16-INT8/yolov5l_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov5_FP16-INT8_yolov5l_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/yolov5/FP16-INT8/yolov5l_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov5_FP16-INT8_yolov5l_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/yolov5/FP16-INT8/yolov5l_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov5_FP16-INT8_yolov5l_1_3_640_640.xml__GPU_1__latency.txt
