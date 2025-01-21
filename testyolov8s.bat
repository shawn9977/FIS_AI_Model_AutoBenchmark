time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov8_FP32_yolov8s_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov8_FP32_yolov8s_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov8_FP32_yolov8s_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov8_FP32_yolov8s_1_3_640_640.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_4_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov8_FP32_yolov8s_4_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP32/yolov8s_4_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov8_FP32_yolov8s_4_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov8_FP16_yolov8s_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov8_FP16_yolov8s_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov8_FP16_yolov8s_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov8_FP16_yolov8s_1_3_640_640.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_4_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov8_FP16_yolov8s_4_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16/yolov8s_4_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov8_FP16_yolov8s_4_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov8_FP16-INT8_yolov8s_1_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov8_FP16-INT8_yolov8s_1_2048_2048_3.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov8_FP16-INT8_yolov8s_1_3_640_640.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov8_FP16-INT8_yolov8s_1_3_640_640.xml__GPU_1__latency.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_4_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov8_FP16-INT8_yolov8s_4_2048_2048_3.xml__GPU_1__throughput.txt
time /T
benchmark_app -m ./models/public/yolov8/FP16-INT8/yolov8s_4_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov8_FP16-INT8_yolov8s_4_2048_2048_3.xml__GPU_1__latency.txt
