FROM nvidia/cuda:12.8.1-base-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN  apt-get update && apt-get install -y --no-install-recommends \
	build-essential cmake git pkg-config \
	libjpeg-dev libpng-dev libtiff-dev \
	libavcodec-dev libavformat-dev libswscale-dev \
	libv4l-dev libxvidcore-dev libx264-dev \
	libgtk-3-dev libcanberra-gtk* \
	libatlas-base-dev gfortran \
	python3-dev python3-pip python3-numpy \
	wget unzip curl vim \
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
	numpy pandas scikit-learn seaborn \
	pyshark matplotlib ultralytics

RUN pip install "mmdet>=3.0.0,<4.0.0"

RUN pip install -U mmcv==2.1.0 -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.1/index.html
# Install xtcocotools
RUN pip install cython
RUN pip install xtcocotools




RUN mkdir -p /workspace/projects
WORKDIR /workspace/projects
