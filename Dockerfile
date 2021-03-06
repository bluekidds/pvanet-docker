FROM kaixhin/cuda-caffe:7.5

MAINTAINER Chun-Hao, Chang <ccha97u@gmail.com>


RUN cd ~/ \
	&& git clone  --recursive https://github.com/ShuaiW/pva-faster-rcnn.git \
	&& cd pva-faster-rcnn/ \
        && git remote add gb https://github.com/GBJim/pvanet.git \
 	&& git fetch gb production \
        && git checkout production \ 
	&& sh models/download_production_model.sh \
	&& cp Makefile.config caffe-fast-rcnn/ \
	&& cd lib/  \
        && make \
	&& cd ../caffe-fast-rcnn \
 	&& make -j8 && make pycaffe \
	&& pip install easydict \
	&& apt-get -y install python-opencv \
	&& apt-get -y install python-tk 

WORKDIR /root	
	
	 
 	
 	
	
