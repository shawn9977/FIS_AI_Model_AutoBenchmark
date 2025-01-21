set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d CPU -hint throughput > results/yolov5_FP32_yolov5s_1_3_640_640.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d CPU -hint latency > results/yolov5_FP32_yolov5s_1_3_640_640.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d GPU.0 -hint throughput > results/yolov5_FP32_yolov5s_1_3_640_640.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d GPU.0 -hint latency > results/yolov5_FP32_yolov5s_1_3_640_640.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov5_FP32_yolov5s_1_3_640_640.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_3_640_640.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov5_FP32_yolov5s_1_3_640_640.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d CPU -hint throughput > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d CPU -hint latency > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d GPU.0 -hint throughput > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d GPU.0 -hint latency > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint throughput > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP32/yolov5s_1_2048_2048_3.xml -infer_precision f32 -d GPU.1 -hint latency > results/yolov5_FP32_yolov5s_1_2048_2048_3.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d CPU -hint throughput > results/yolov5_FP16_yolov5s_1_3_640_640.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d CPU -hint latency > results/yolov5_FP16_yolov5s_1_3_640_640.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d GPU.0 -hint throughput > results/yolov5_FP16_yolov5s_1_3_640_640.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d GPU.0 -hint latency > results/yolov5_FP16_yolov5s_1_3_640_640.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov5_FP16_yolov5s_1_3_640_640.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov5_FP16_yolov5s_1_3_640_640.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d CPU -hint throughput > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d CPU -hint latency > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d GPU.0 -hint throughput > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d GPU.0 -hint latency > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16/yolov5s_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov5_FP16_yolov5s_1_2048_2048_3.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d CPU -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d CPU -hint latency > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d GPU.0 -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d GPU.0 -hint latency > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d GPU.1 -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_3_640_640.xml -d GPU.1 -hint latency > results/yolov5_FP16-INT8_yolov5s_1_3_640_640.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d CPU -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d CPU -hint latency > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d GPU.0 -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d GPU.0 -hint latency > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d GPU.1 -hint throughput > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/yolov5/FP16-INT8/yolov5s_1_2048_2048_3.xml -d GPU.1 -hint latency > results/yolov5_FP16-INT8_yolov5s_1_2048_2048_3.xml__GPU_1__latency.txt
