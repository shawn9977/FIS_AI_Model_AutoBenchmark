source openvino_env/bin/activate
rm -rf res
rm -rf test_list.txt
rm -rf res_list.txt
rm -rf hp_data.txt
rm -rf lt_data.txt

mkdir res
cd res
mkdir public
cd public
mkdir yolov5
cd yolov5
mkdir FP32
mkdir FP16
mkdir FP16-INT8
cd ../
mkdir yolov8
cd yolov8
mkdir FP32
mkdir FP16
mkdir FP16-INT8
cd ../
mkdir sam
cd sam
mkdir FP16-INT8
cd ..
mkdir mobile_sam
cd mobile_sam
mkdir FP32
mkdir FP16
mkdir FP16-INT8
cd ..
mkdir mobilevit
cd mobilevit
mkdir FP32
mkdir FP16
mkdir FP16-INT8
cd ..
cd ../../


cd models
find public -name *.xml > ../test_list.txt
cd ..

while read line
do
	if [[ $line == *"FP32"* ]]
	then
		benchmark_app -m models/$line -hint latency -d CPU > res/${line}_CPU_lt -infer_precision f32
		benchmark_app -m models/$line -hint throughput -d CPU > res/${line}_CPU_hp -infer_precision f32
	        benchmark_app -m models/$line -hint latency -d GPU.0 > res/${line}_GPU_lt -infer_precision f32
        	benchmark_app -m models/$line -hint throughput -d GPU.0 > res/${line}_GPU_hp -infer_precision f32
	else
                benchmark_app -m models/$line -hint latency -d CPU > res/${line}_CPU_lt
                benchmark_app -m models/$line -hint throughput -d CPU > res/${line}_CPU_hp
                benchmark_app -m models/$line -hint latency -d GPU.0 > res/${line}_GPU_lt
                benchmark_app -m models/$line -hint throughput -d GPU.0 > res/${line}_GPU_hp
	fi
done < test_list.txt

find res -name *.xml* > res_list.txt

while read line
do
        if [[ $line == *"lt" ]]
        then
                echo $line >> lt_data.txt
                awk '/Average/' $line >> lt_data.txt
        else
		echo $line >> hp_data.txt
                awk '/Throughput/' $line >> hp_data.txt
        fi
done < res_list.txt


