#!/usr/bin/env bash
#set -x
readarray -t models < $1
readarray -t devices < $2
readarray -t hints < $3


#windows=false
windows=true

linux_timeout_command="timeout 8m "

if [[ $windows == true ]];then
    linux_timeout_command=""
fi

if [[ $windows != true ]];then
echo "set -x"
fi

for model in "${models[@]}"; do
    for device in "${devices[@]}"; do
        for hint in "${hints[@]}"; do

        if [[ $windows == true ]];then
	        echo "time /T"
        else
	    echo "sleep 5"
            echo date
        fi
            #printf 'Running: %s %s %s\n' "$model" "$device" "$hint"

            filename=$(basename $model)
            datatype=$(basename $(dirname $model))
            modelname=$(basename $(dirname $(dirname $model)))
            modelname=$(echo "${modelname}_${datatype}_${filename}" )

            # modelname=$(echo $model | tr / _)
            # modelname=$(echo $modelname | tr . _)
            devicename=$(echo $device | tr . _)
            devicename=$(echo $devicename | tr : -)
            devicename=$(echo $devicename | tr , -)

            # echo ${modelname}_${devicename}_${hint}.txt



            if [[ $model == *deeplabv3*2048*  ]]; then
                if [[ $model == *FP32*  ]]; then
                # echo "benchmark_app -m $model -infer_precision f32 -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -infer_precision f32 -shape [1,3,2048,2048] -d $device -hint $hint > results/${modelname}_dynamic_1_3_2048_2048__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -infer_precision f32 -shape [4,3,2048,2048] -d $device -hint $hint > results/${modelname}_dynamic_4_3_2048_2048__${devicename}__${hint}.txt"
                else
                # echo "benchmark_app -m $model -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -shape [1,3,2048,2048] -d $device -hint $hint > results/${modelname}_dynamic_1_3_2048_2048__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -shape [4,3,2048,2048] -d $device -hint $hint > results/${modelname}_dynamic_4_3_2048_2048__${devicename}__${hint}.txt"
                fi
            else 
                if [[ $model == *FP32*  ]]; then
                # echo "benchmark_app -m $model -infer_precision f32 -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -infer_precision f32 -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                else
                # echo "benchmark_app -m $model -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                echo $linux_timeout_command"benchmark_app -m $model -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt"
                fi
            fi


        done
    done
done
