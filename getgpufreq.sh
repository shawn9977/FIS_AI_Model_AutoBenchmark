
# set -x
res=$(timeout  -s SIGKILL 0.1s sudo intel_gpu_top -s 50 )

echo $res

idxFreq='$55'
idxUsage='$60'


mFreq=$(echo $res | awk '{print '${idxFreq}'}')
echo Freq is $mFreq MHZ


mUsage=$(echo $res | awk '{print '${idxUsage}'}')
echo Render Usage is $mUsage %


function getData() {
    res=$(timeout  -s SIGKILL 0.1s sudo intel_gpu_top -s 50 )
    mFreq=$(echo $res | awk '{print '${idxFreq}'}')
    mUsage=$(echo $res | awk '{print '${idxUsage}'}')

    echo Freq is $mFreq MHZ Render Usage is $mUsage %

    echo $mFreq,$mUsage >> $mResFreqDir/$file

}

mResDataDir="./results"
mResFreqDir=$mResDataDir"Freq"

file=$(ls -rt ${mResDataDir} | tail -n 1 )

filename="${file%.*}"

echo file is $file

echo filename is $filename

echo resFreq Directory is $mResFreqDir

mkdir -p $mResFreqDir

mResult=""
mLine=""

if [[ $file == *throughput* ]]
then
    echo throughput
    mLine=$( grep Throughput $mResDataDir/$file )
    echo $mLine
else
    echo latency
    mLine=$( grep Average $mResDataDir/$file )
    echo $mLine
fi



for i in {1..20}
do

file=$(ls -rt ${mResDataDir} | tail -n 1 )

if [[ $file == *throughput* ]]
then
    echo throughput
    mLine=$( grep Throughput $mResDataDir/$file )
    echo $mLine
else
    echo latency
    mLine=$( grep Average $mResDataDir/$file )
    echo $mLine
fi


while [[ $mLine == "" ]]
do
echo wait
getData
sleep 1

file=$(ls -rt ${mResDataDir} | tail -n 1 )

if [[ $file == *throughput* ]]
then
    echo throughput
    mLine=$( grep Throughput $mResDataDir/$file )
    echo $mLine
else
    echo latency
    mLine=$( grep Average $mResDataDir/$file )
    echo $mLine
fi
done # done while

sleep 5
echo for loop $i/20

done # done for i in {1..20}

echo get2gpufreq.sh finished ...


