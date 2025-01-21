set -x
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d CPU -hint throughput > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d CPU -hint latency > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.0 -hint throughput > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.0 -hint latency > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.1 -hint throughput > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.1 -hint latency > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d CPU -hint throughput > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d CPU -hint latency > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.0 -hint throughput > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.0 -hint latency > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.1 -hint throughput > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.1 -hint latency > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d CPU -hint throughput > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__CPU__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d CPU -hint latency > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__CPU__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.0 -hint throughput > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_0__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.0 -hint latency > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_0__latency.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.1 -hint throughput > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
sleep 5
date
timeout 8m benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.1 -hint latency > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
