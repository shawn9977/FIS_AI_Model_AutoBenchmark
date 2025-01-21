time /T
benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.1 -hint throughput > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/unet-camvid/FP16/unet-camvid-onnx-0001.xml -d GPU.1 -hint latency > results/unet-camvid_FP16_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.1 -hint throughput > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/unet-camvid/FP16-INT8/unet-camvid-onnx-0001.xml -d GPU.1 -hint latency > results/unet-camvid_FP16-INT8_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.1 -hint throughput > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/unet-camvid/FP32/unet-camvid-onnx-0001.xml -infer_precision f32 -d GPU.1 -hint latency > results/unet-camvid_FP32_unet-camvid-onnx-0001.xml__GPU_1__latency.txt
