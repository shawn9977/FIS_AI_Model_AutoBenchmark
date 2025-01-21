
## Steps to prepare MeteorLake environment  

1. ubuntu 22.04  
1. install linux kernel 6.7.1
    https://kernel.ubuntu.com/mainline/v6.7.1/amd64/  
    download these 4 deb ，
    - linux-headers-xxx.deb
    - linux-headers-xxx_all.deb
    - linux-image-xxx.deb
    - linux-module-xxx.deb
   ```bash
   sudo dpkg -i *deb
   ```
1. download mtl firmware
   ```bash
   git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
   cd linux-firmware/i915
   sudo mv mtl_* /lib/firmware/i915/
   ```

1. reboot computer
   ```bash
   if everything works, we should see /dev/dri/renderD128 device
   ll /dev/dri/renderD128 
   crw-rw----+ 1 root render 11:12 /dev/dri/renderD128
   ```


1. install intel compute runtime https://github.com/intel/compute-runtime/releases



1. add current user to group render
   ```bash
   sudo usermod -aG render $USER  
   cat /etc/group  | grep render
   ```

1. install clinfo
   ```bash
   sudo apt install clinfo
   
   $ clinfo
   Number of platforms          2
     Platform Name              Intel(R) OpenCL Graphics
     Platform Vendor            Intel(R) Corporation
     Platform Version           OpenCL 3.0
     Platform Profile           FULL_PROFILE
   ```

1. install npu driver https://github.com/intel/linux-npu-driver/releases
   


## Steps to prepare environment (platform except MeteorLake)

1. Install Ubuntu 22.04
1. Check iGPU Driver
   ```bash
   $ sudo lspci -v | grep -A20 VGA
     ...
           Kernel driver in use: i915
           Kernel modules: i915

   $ hwinfo --display
   ...
     Driver Info #0:
       Driver Status: i915 is active
       Driver Activation Cmd: "modprobe i915"
   ```

1. Install intel compute runtine driver  
   Acoording to [intel dgpu docs](https://dgpu-docs.intel.com/driver/client/overview.html#client-intel-package-repository-configuration)
   execute 3.1.2 to 3.1.4  
   command to Check OpenCL installation  
   ```bash
   $ clinfo
   Number of platforms          2
     Platform Name              Intel(R) OpenCL Graphics
     Platform Vendor            Intel(R) Corporation
     Platform Version           OpenCL 3.0
     Platform Profile           FULL_PROFILE
   ```

## Steps to prepare test models

1. Download and prepare public model

```bash
./additional_model_prepare.sh
```

2. Download model provided by intel openvino

```bash
source openvino_env/bin/activate

omz_downloader --list model-download.lst --output_dir models --jobs 10

```

3. change shape and convert data type of model provided by intel

```bash
source openvino_env/bin/activate

bash optimize_deeplabv3.sh
bash optimize_detr-resnet50.sh
bash optimize_efficientnet-v2-b0.sh
bash optimize_fasterrcnn_resnet50_fpn_v2_coco.sh
bash optimize_fastseg-large.sh
bash optimize_fastseg-small.sh
bash optimize_mask_rcnn_resnet50_atrous_coco.sh
bash optimize_mobilenet-v2.sh
bash optimize_mobilenet-v3-small-1.0-224-tf.sh
bash optimize_resnet-50-pytorch.sh
bash optimize_swin-tiny-patch4-window7-224.sh

```

4. make deeplabv3 2048 model

```bash
source openvino_env/bin/activate
python3 public_optimize_deeplabv3.py
python3 public_converter_deeplabv3_FP16-INT8.py

```

## Steps to generate test command

```bash

./genbenchmark.sh model_deeplabv3.lst         devices.lst  hints.lst  > testdeeplabv3.sh   
./genbenchmark.sh model_detr.lst              devices.lst  hints.lst  > testdetr.sh     
./genbenchmark.sh model_efficientnetv2.lst    devices.lst  hints.lst  > testefficientnetv2.sh      
./genbenchmark.sh model_faster_rcnn.lst       devices.lst  hints.lst  > testfaster_rcnn.sh    
./genbenchmark.sh model_fastseg-large.lst     devices.lst  hints.lst  > testfastseg-large.sh      
./genbenchmark.sh model_fastseg-small.lst     devices.lst  hints.lst  > testfastseg-small.sh      
./genbenchmark.sh model_mask_rcnn.lst         devices.lst  hints.lst  > testmask_rcnn.sh 
./genbenchmark.sh model_mobile_net_v2.lst     devices.lst  hints.lst  > testmobile_net_v2.sh  
./genbenchmark.sh model_mobile_net_v3.lst     devices.lst  hints.lst  > testmobile_net_v3.sh        
./genbenchmark.sh model_mobile_sam.lst        devices.lst  hints.lst  > testmobile_sam.sh       
./genbenchmark.sh model_mobilevit.lst         devices.lst  hints.lst  > testmobilevit.sh     
./genbenchmark.sh model_resnet_50.lst         devices.lst  hints.lst  > testresnet_50.sh   
./genbenchmark.sh model_sam.lst               devices.lst  hints.lst  > testsam.sh     
./genbenchmark.sh model_swin_int8.lst         devices.lst  hints.lst  > testswin_int8.sh       
./genbenchmark.sh model_unet_camvid.lst       devices.lst  hints.lst  > testunet_camvid.sh       
./genbenchmark.sh model_yolov5l.lst           devices.lst  hints.lst  > testyolov5l.sh    
./genbenchmark.sh model_yolov5s.lst           devices.lst  hints.lst  > testyolov5s.sh   
./genbenchmark.sh model_yolov8l.lst           devices.lst  hints.lst  > testyolov8l.sh  
./genbenchmark.sh model_yolov8s.lst           devices.lst  hints.lst  > testyolov8s.sh   
```

if in windows, use following command  

change genbenchmark.sh from 

```bash
windows=true
```

to 

```bash
windows=false
```



```bash


./genbenchmark.sh model_deeplabv3.lst         devices.lst  hints.lst  > testdeeplabv3.bat   
./genbenchmark.sh model_detr.lst              devices.lst  hints.lst  > testdetr.bat     
./genbenchmark.sh model_efficientnetv2.lst    devices.lst  hints.lst  > testefficientnetv2.bat      
./genbenchmark.sh model_faster_rcnn.lst       devices.lst  hints.lst  > testfaster_rcnn.bat    
./genbenchmark.sh model_fastseg-large.lst     devices.lst  hints.lst  > testfastseg-large.bat      
./genbenchmark.sh model_fastseg-small.lst     devices.lst  hints.lst  > testfastseg-small.bat      
./genbenchmark.sh model_mask_rcnn.lst         devices.lst  hints.lst  > testmask_rcnn.bat 
./genbenchmark.sh model_mobile_net_v2.lst     devices.lst  hints.lst  > testmobile_net_v2.bat  
./genbenchmark.sh model_mobile_net_v3.lst     devices.lst  hints.lst  > testmobile_net_v3.bat        
./genbenchmark.sh model_mobile_sam.lst        devices.lst  hints.lst  > testmobile_sam.bat       
./genbenchmark.sh model_mobilevit.lst         devices.lst  hints.lst  > testmobilevit.bat     
./genbenchmark.sh model_resnet_50.lst         devices.lst  hints.lst  > testresnet_50.bat   
./genbenchmark.sh model_sam.lst               devices.lst  hints.lst  > testsam.bat     
./genbenchmark.sh model_swin_int8.lst         devices.lst  hints.lst  > testswin_int8.bat       
./genbenchmark.sh model_unet_camvid.lst       devices.lst  hints.lst  > testunet_camvid.bat       
./genbenchmark.sh model_yolov5l.lst           devices.lst  hints.lst  > testyolov5l.bat    
./genbenchmark.sh model_yolov5s.lst           devices.lst  hints.lst  > testyolov5s.bat   
./genbenchmark.sh model_yolov8l.lst           devices.lst  hints.lst  > testyolov8l.bat  
./genbenchmark.sh model_yolov8s.lst           devices.lst  hints.lst  > testyolov8s.bat   

```


## test models 

```bash


bash testdeeplabv3.sh   
bash testdetr.sh     
bash testefficientnetv2.sh      
bash testfaster_rcnn.sh    
bash testfastseg-large.sh      
bash testfastseg-small.sh      
bash testmask_rcnn.sh 
bash testmobile_net_v2.sh  
bash testmobile_net_v3.sh        
bash testmobile_sam.sh       
bash testmobilevit.sh     
bash testresnet_50.sh   
bash testsam.sh     
bash testswin_int8.sh       
bash testunet_camvid.sh       
bash testyolov5l.sh    
bash testyolov5s.sh   
bash testyolov8l.sh  
bash testyolov8s.sh   

```

if windows

```bash

.\testdeeplabv3.bat   
.\testdetr.bat     
.\testefficientnetv2.bat      
.\testfaster_rcnn.bat    
.\testfastseg-large.bat      
.\testfastseg-small.bat      
.\testmask_rcnn.bat 
.\testmobile_net_v2.bat  
.\testmobile_net_v3.bat        
.\testmobile_sam.bat       
.\testmobilevit.bat     
.\testresnet_50.bat   
.\testsam.bat     
.\testswin_int8.bat       
.\testunet_camvid.bat       
.\testyolov5l.bat    
.\testyolov5s.bat   
.\testyolov8l.bat  
.\testyolov8s.bat   

```

## Steps to collect gpu freq and gpu usage when testing

1. make directory resultsFreq

```bash

mkdir resultsFreq

```

2. create a new window modify getgpufreq.sh to correct idx

```bash
idxFreq='$55'
idxUsage='$60'
```

change to correct index in order to get correct number which in intel_gpu_top

3. start getgpufreq.sh with sudo permission

```bash

sudo bash getgpufreq.sh

```

4. the script will stop after test script stops


## Steps to collect test data

```bash

cp -r results results_i7_12700
cp -r resultsFreq resultsFreq_i7_12700 

```

modify gendata.py change 

```bash
result_dir = "./results_N97"
result_freq_dir = "./resultsFreq_N97"
```
to  
```bash
result_dir = "./results_i7_12700"
result_freq_dir = "./results_i7_12700"
```

run python script and check csv file results_i7_12700.csv

```bash
python3 gendata.py
```




>>>>>>> ffc10bf (Initial commit from bmk_openvino (cleaned))
>>>>>>> 3da2c01 (Initial commit from bmk_openvino (cleaned))
