sudo apt update 
sudo apt install python3-pip -y
sudo apt install git -y

python3 -m venv openvino_env
source openvino_env/bin/activate
python -m pip install --upgrade pip
python -m pip install openvino
pip install nncf
pip install openvino openvino-dev[onnx,pytorch,tensorflow]
pip  install CocoDataset
pip install ultralytics
pip install nncf
pip install segment_anything
pip install pandas
pip install timm
pip install opencv-python

rm -rf org_models
rm -rf datasets

mkdir datasets
mkdir org_models
mkdir models
cd models
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


cd datasets
wget -O val2017.zip http://images.cocodataset.org/zips/val2017.zip --no-check-certificate 
wget -O coco2017labels-segments.zip https://github.com/ultralytics/yolov5/releases/download/v1.0/coco2017labels-segments.zip --no-check-certificate
wget -O coco.yaml https://raw.githubusercontent.com/ultralytics/ultralytics/main/ultralytics/cfg/datasets/coco.yaml --no-check-certificate
unzip coco2017labels-segments.zip -d ./
unzip val2017.zip -d ./coco/images/
wget "https://ultralytics.com/assets/coco128.zip"
unzip coco128.zip
mkdir imagenet
cd imagenet
mkdir val
cd ..
wget -O ILSVRC2012_img_val.tar https://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_val.tar --no-check-certificate
tar -xvf ILSVRC2012_img_val.tar --directory imagenet/val/.
cd imagenet/val && \
 wget -qO- https://raw.githubusercontent.com/soumith/imagenetloader.torch/master/valprep.sh | bash && \
 cd ../../
cd ..

cd org_models

wget https://github.com/ultralytics/yolov5/archive/refs/heads/master.zip
unzip master.zip
cd yolov5-master
wget https://github.com/ultralytics/yolov5/releases/download/v7.0/yolov5s.pt
wget https://github.com/ultralytics/yolov5/releases/download/v7.0/yolov5l.pt
python3 export.py --weights yolov5s.pt --dynamic --include onnx
python3 export.py --weights yolov5l.pt --dynamic --include onnx
mo --input_model yolov5s.onnx --layout="images(NCHW->NHWC)" --input_shape [1,3,640,640] --compress_to_fp16=True --output_dir ./ --model_name yolov5s
mo --input_model yolov5l.onnx --layout="images(NCHW->NHWC)" --input_shape [1,3,640,640] --compress_to_fp16=True --output_dir ./ --model_name yolov5l
for m in yolov5s yolov5l
do	
	for fp in True False
	do
		for b in 1 4
			do
				if [[ ${fp} = True ]]; then
					p=FP16
				else
					p=FP32
				fi
				mo --input_model ${m}.onnx --layout="images(NCHW->NHWC)" --input_shape [${b},3,2048,2048] --compress_to_fp16=${fp} --output_dir ../../models/public/yolov5/${p} --model_name ${m}_${b}_2048_2048_3
               mo --input_model ${m}.onnx  --input_shape [${b},3,640,640] --compress_to_fp16=${fp} --output_dir ../../models/public/yolov5/${p} --model_name ${m}_${b}_3_640_640
				if [[ ${fp} = True ]]; then
				python3 ../../additional_model_convert.py --model yolo --input ./${m}.xml --output ../../models/public/yolov5/FP16-INT8/${m}_${b}_2048_2048_3.xml --batch ${b} --size 2048 2048 --channels NHWC
				python3 ../../additional_model_convert.py --model yolo --input ../../models/public/yolov5/${p}/${m}_1_3_640_640.xml --output ../../models/public/yolov5/FP16-INT8/${m}_${b}_3_640_640.xml --batch ${b} --size 640 640 --channels NCHW
				fi
			done
	done
done
cd ..


mkdir yolov8
cd yolov8
yolo export model=yolov8s.pt format=onnx dynamic=True
yolo export model=yolov8l.pt format=onnx dynamic=True
mo --input_model yolov8s.onnx --layout="images(NCHW->NHWC)" --input_shape [1,3,640,640] --compress_to_fp16=True --output_dir ./ --model_name yolov8s
mo --input_model yolov8l.onnx --layout="images(NCHW->NHWC)" --input_shape [1,3,640,640] --compress_to_fp16=True --output_dir ./ --model_name yolov8l
for m in yolov8s yolov8l
do		
	for fp in True False
	do
		for b in 1 4
			do
				if [[ ${fp} = True ]]; then
					p=FP16
				else
					p=FP32
				fi
				mo --input_model ${m}.onnx --layout="images(NCHW->NHWC)" --input_shape [${b},3,2048,2048] --compress_to_fp16=${fp} --output_dir ../../models/public/yolov8/${p} --model_name ${m}_${b}_2048_2048_3
               mo --input_model ${m}.onnx  --input_shape [${b},3,640,640] --compress_to_fp16=${fp} --output_dir ../../models/public/yolov8/${p} --model_name ${m}_${b}_3_640_640
				if [[ ${fp} = True ]]; then
				python3 ../../additional_model_convert.py --model yolo --input ./${m}.xml --output ../../models/public/yolov8/FP16-INT8/${m}_${b}_2048_2048_3.xml --batch ${b} --size 2048 2048 --channels NHWC
				python3 ../../additional_model_convert.py --model yolo --input ../../models/public/yolov8/${p}/${m}_1_3_640_640.xml --output ../../models/public/yolov8/FP16-INT8/${m}_${b}_3_640_640.xml --batch ${b} --size 640 640 --channels NCHW
				fi
			done
	done
done
cd ..


mkdir sam
cd sam
wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
python3 ../../additional_model_convert.py --model sam
cd ..


wget -O mobile-sam.zip https://codeload.github.com/ChaoningZhang/MobileSAM/zip/refs/heads/master
unzip mobile-sam.zip
cd MobileSAM-master
pip install -e .
python3 ../../additional_model_convert.py --model mobile_sam
cd ..

mkdir mobilevit
cd mobilevit
git clone https://github.com/WZMIAOMIAO/deep-learning-for-image-processing.git
mv deep-learning-for-image-processing/pytorch_classification/MobileViT/* ./
wget https://docs-assets.developer.apple.com/ml-research/models/cvnets/classification/mobilevit_s.pt

python3 ../../additional_model_convert.py --model mobilevit_onnx

mo --input_model tmp.onnx  --input_shape [1,3,224,224] --compress_to_fp16=False --output_dir ../../models/public/mobilevit/FP32 --model_name mobilevit_1_3_224_224
mo --input_model tmp.onnx  --input_shape [1,3,224,224] --compress_to_fp16=True --output_dir ../../models/public/mobilevit/FP16 --model_name mobilevit_1_3_224_224
mo --input_model tmp.onnx  --input_shape [4,3,224,224] --compress_to_fp16=False --output_dir ../../models/public/mobilevit/FP32 --model_name mobilevit_4_3_224_224
mo --input_model tmp.onnx  --input_shape [4,3,224,224] --compress_to_fp16=True --output_dir ../../models/public/mobilevit/FP16 --model_name mobilevit_4_3_224_224
python3 ../../additional_model_convert.py --model mobilevit_ir
cd .. 



cd ..
