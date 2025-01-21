#!/usr/bin/env bash
readarray -t models < $1
readarray -t devices < $2
readarray -t hints < $3
for model in "${models[@]}"; do
 for device in "${devices[@]}"; do
 for hint in "${hints[@]}"; do
 printf 'Running: %s %s %s\n' "$model" "$device" "$hint"
 modelname=$(echo $model | tr / _)
 modelname=$(echo $modelname | tr . _)
 devicename=$(echo $device | tr . _)
 devicename=$(echo $devicename | tr : -)
 devicename=$(echo $devicename | tr , -)
 benchmark_app -m $model -d $device -hint $hint > results/${modelname}__${devicename}__${hint}.txt
 #echo "1" > results/${modelname}__${devicename}__${hint}.txt
 done
 done
done
