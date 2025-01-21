
import subprocess
import statistics

from collections import defaultdict

import csv


# models_public_swin-tiny-patch4-window7-224_FP16_swin-tiny-patch4-window7-224_xml__GPU_0__latency
# fastseg-small_FP16-INT8_Batch4_fastseg-small.xml__GPU_0__throughput.txt

result_dir = "./results"

result_freq_dir = ""

# result_freq_dir = "./resultsFreq_N97"

# result_freq_dir = "./resultsFreq_155H_28W"

# gDeviceList = ['NPU']
# gDeviceList = ['GPU_0']

# gDeviceList = ["CPU", "GPU_0", "GPU_1"]
gDeviceList = ["GPU_1"]

model_name = ["fastseg-small",      #0
              "fastseg-large",      #1
              "resnet-50-pytorch",  #2
              "deeplabv3.xml_",    #3           
              "detr-resnet50",      #4
              "efficientnet-v2",    #5
              "faster_rcnn_resnet50",#6
              "mask_rcnn_resnet50", #7
              "mobilenet-v2",       #8
              "mobilenet-v3",       #9
              "swin-tiny-patch4",   #10
              "unet-camvid",        #11
              "sam",                #12
              "mobile_sam",         #13
              "yolov5s",            #14
              "yolov5l",            #15
              "yolov8s",            #16
              "yolov8l",            #17
              "mobilevit",          #18
              "deeplabv3.xml_dynamic", #19
              ]


def nested_dict(n, type):
    if n == 1:
        return defaultdict(type)
    else:
        return defaultdict(lambda: nested_dict(n-1, type))

class Model:

    def __init__(self, name, dataTypeList, sizeList=["_"], deviceList=[]):
        self.name = name
        self.dataTypeList = dataTypeList
        self.sizeList = sizeList
        self.deviceList = deviceList
        self.dataDict = nested_dict(4, str)
        self.hintList = ["latency", "throughput"]
        self.dataNum = 0
        self.gpuFreqDict  = nested_dict(3, str)
        self.gpuUsageDict = nested_dict(3, str)

    
    def displayAllFiles():
        prefix = "models_public"

    def getData(self):
        for sDataType in self.dataTypeList:
            for sSize in self.sizeList:
                for sDevice in self.deviceList:
                    for sHint in self.hintList:

                        sResult = ""
                        if(sHint == "latency"):
                            command = f"find {result_dir} -name '*{sDataType}_{self.name}*{sSize}*{sDevice}*{sHint}*' | xargs grep Average | tr -d -c 0-9."
                            print(command)
                            sResult = subprocess.getoutput(command)
                            self.dataDict[sDataType][sSize][sDevice][sHint] = sResult
                            self.dataNum += 1
                            print(self.name, sDataType,sDevice,sHint, self.dataDict[sDataType][sSize][sDevice][sHint], "ms")
                        if(sHint == "throughput"):
                            command = f"find {result_dir} -name '*{sDataType}_{self.name}*{sSize}*{sDevice}*{sHint}*' | xargs grep Throughput | tr -d -c 0-9. "
                            print(command)
                            sResult = subprocess.getoutput(command)
                            self.dataDict[sDataType][sSize][sDevice][sHint] = sResult
                            self.dataNum += 1
                            print(self.name, sDataType,sDevice,sHint, self.dataDict[sDataType][sSize][sDevice][sHint], "fps")
    
    def getGpuData(self):
        for sDataType in self.dataTypeList:
            for sSize in self.sizeList:
                for sHint in self.hintList:
                    sResult = ""    
                    command = f"find {result_freq_dir} -name '*{sDataType}_{self.name}*{sSize}*GPU*{sHint}*' "  
                    print(command)        
                    sResult = subprocess.getoutput(command)
                    print(sResult)        
                    sGpuFreq = []
                    sGpuUsage = []  
                    if(sResult != ""):
                        with open(sResult) as sFile:
                            lines = sFile.readlines()
                            for line in lines:
                                x = line.strip().split(",")
                                if(x[0] == '' or x[0] == '0' or x[1] == '' or x[1] == '0.00' ):
                                    continue
                                sGpuFreq.append( float(x[0]) )
                                sGpuUsage.append( float(x[1]) )
                            
                            mGpuFreq = ''
                            mGpuUsage = ''

                            if len(sGpuFreq) > 0 :
                                mGpuFreq   = int(statistics.mean(sGpuFreq))
                            if len(sGpuUsage) > 0 :
                                mGpuUsage  = statistics.median(sGpuUsage) 
                            print()
                            print( mGpuFreq )
                            print()
                            print( mGpuUsage )

                            self.gpuFreqDict[sDataType][sSize][sHint] = mGpuFreq
                            self.gpuUsageDict[sDataType][sSize][sHint] = mGpuUsage


                                
    
    def getDataByDataType(self, dataType, size, idx, sdx):
        result = []
        if( idx == 0 and sdx == 0 ):
            result.append(self.name)
        else:
            result.append("")
        result.append(dataType)
        result.append(size)
        for sDevice in self.deviceList:
            for sHint in self.hintList:
                result.append(self.dataDict[dataType][size][sDevice][sHint])
        
        if ( result_freq_dir != "" ):
            result.append(self.gpuFreqDict[dataType][size][sHint] )
            result.append(self.gpuUsageDict[dataType][size][sHint] )

        return result
        





mFastsegSmall = Model(name = model_name[0], 
              dataTypeList = ["FP16-INT8","FP16"], 
              deviceList= gDeviceList)

mFastsegSmall.getData()


print()
print()

mFastsegLarge = Model(name = model_name[1],
              dataTypeList = ["FP16-INT8","FP16"], 
              deviceList= gDeviceList)
mFastsegLarge.getData()

print()
print()

mResnet = Model(name = model_name[2],
              dataTypeList = ["FP16-INT8","FP16"], 
              deviceList= gDeviceList)                
mResnet.getData()

print()
print()


mDeeplabv3 = Model(name = model_name[3],
              dataTypeList = ["FP16-INT8", "FP16", "FP32",],
                            #   "FP16-INT8_Batch4", "FP16_Batch4", "FP32_Batch4"], 
              deviceList= gDeviceList)                
mDeeplabv3.getData()
print()
print()


mDetr = Model(name = model_name[4],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mDetr.getData()
print()
print()

mEfficient = Model(name = model_name[5],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mEfficient.getData()
print()
print()

mFasterRcnn = Model(name = model_name[6],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mFasterRcnn.getData()
print()
print()

mMaskRcnn = Model(name = model_name[7],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mMaskRcnn.getData()
print()
print()

mMobileNetV2 = Model(name = model_name[8],
              dataTypeList = ["FP16-INT8",
                              "FP16"], 
              deviceList= gDeviceList)
mMobileNetV2.getData()
print()
print()

mMobileNetV3 = Model(name = model_name[9],
              dataTypeList = ["FP16-INT8",
                              "FP16"], 
              deviceList= gDeviceList)
mMobileNetV3.getData()
print()
print()

mSwinTiny = Model(name = model_name[10],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mSwinTiny.getData()
print()
print()

mUnet = Model(name = model_name[11],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mUnet.getData()
print()
print()

# sizeList

mSam = Model(name = model_name[12],
              sizeList = ["1_1024_1024_3"],
              dataTypeList = ["FP16-INT8", "FP16"], 
              deviceList= gDeviceList)
mSam.getData()



mMobileSam = Model(name = model_name[13],
              sizeList = ["1_3_1024_1024"],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mMobileSam.getData()


mYolov5s = Model(name = model_name[14],
              sizeList = ["1_3_640_640", "1_2048_2048_3"],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mYolov5s.getData()



mYolov5l = Model(name = model_name[15],
              sizeList = ["1_3_640_640", "1_2048_2048_3" ],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mYolov5l.getData()



mYolov8s = Model(name = model_name[16],
              sizeList = ["1_3_640_640", "1_2048_2048_3", "4_2048_2048_3"],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mYolov8s.getData()


mYolov8l = Model(name = model_name[17],
              sizeList = ["1_3_640_640", "1_2048_2048_3" ],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mYolov8l.getData()



mMobileVit = Model(name = model_name[18],
              sizeList = ["1_3_224_224"],
              dataTypeList = ["FP16-INT8", "FP16", "FP32"], 
              deviceList= gDeviceList)
mMobileVit.getData()


# mDeeplabDynamic = Model(name = model_name[19],
#               sizeList = ["1_3_2048_2048", "4_3_2048_2048"],
#               dataTypeList = ["FP16_2048-INT8", "FP16_2048", "FP32_2048"], 
#               deviceList= gDeviceList)
# mDeeplabDynamic.getData()



mModelList = [mDeeplabv3, mFastsegSmall, mFastsegLarge, 
              mYolov5s, mYolov5l, mSam, 
              mMobileSam, mYolov8s, mYolov8l, 
              mUnet, mMaskRcnn, mFasterRcnn, 
              mDetr, mMobileNetV2, mMobileNetV3, 
              mResnet, mEfficient, mSwinTiny, 
              mMobileVit,
            #   mDeeplabDynamic,
            ]

if ( result_freq_dir != "" ):
    for iModel in mModelList:
        iModel.getGpuData()


with open(f'{result_dir}.csv', 'wt') as f:

    cw = csv.writer(f)
    # cw.writerow(["", "", "","cpu latency", "cpu throughput"
    #                        , "gpu.0 latency", "gpu.0 throughput"
    #                        , "gpu.1 latency", "gpu.1 throughput"])
    cw.writerow(["", "", "", "gpu.1 latency", "gpu.1 throughput"])
    
    for rModel in mModelList:
        for sdx, sSize in enumerate( rModel.sizeList ):
            for idx, sDataType in enumerate( rModel.dataTypeList ) :
                cw.writerow(rModel.getDataByDataType(sDataType, sSize, idx, sdx))
        # cw.writerow([])









