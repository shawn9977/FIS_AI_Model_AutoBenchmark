time /T
benchmark_app -m models/public/mobilenet-v3-small-1.0-224-tf/FP16-INT8/mobilenet-v3-small-1.0-224-tf.xml -d GPU.1 -hint throughput > results/mobilenet-v3-small-1.0-224-tf_FP16-INT8_mobilenet-v3-small-1.0-224-tf.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilenet-v3-small-1.0-224-tf/FP16-INT8/mobilenet-v3-small-1.0-224-tf.xml -d GPU.1 -hint latency > results/mobilenet-v3-small-1.0-224-tf_FP16-INT8_mobilenet-v3-small-1.0-224-tf.xml__GPU_1__latency.txt
time /T
benchmark_app -m models/public/mobilenet-v3-small-1.0-224-tf/FP16/mobilenet-v3-small-1.0-224-tf.xml -d GPU.1 -hint throughput > results/mobilenet-v3-small-1.0-224-tf_FP16_mobilenet-v3-small-1.0-224-tf.xml__GPU_1__throughput.txt
time /T
benchmark_app -m models/public/mobilenet-v3-small-1.0-224-tf/FP16/mobilenet-v3-small-1.0-224-tf.xml -d GPU.1 -hint latency > results/mobilenet-v3-small-1.0-224-tf_FP16_mobilenet-v3-small-1.0-224-tf.xml__GPU_1__latency.txt
