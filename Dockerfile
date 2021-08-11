FROM nvcr.io/nvidia/dli/dli-nano-ai:v2.0.1-r32.5.0

RUN apt update -y &&\
    apt upgrade  -y && cd ~ &&\
    apt install nano
    
RUN apt-get install -y \
        build-essential cmake git unzip pkg-config \
        libjpeg-dev libpng-dev libgtk2.0-dev \
        python3-dev python3-numpy python3-pip \
        libxvidcore-dev libx264-dev libssl-dev \
        libtbb2 libtbb-dev libdc1394-22-dev \
        gstreamer1.0-tools libv4l-dev v4l-utils \
        libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
        libvorbis-dev libxine2-dev \
        libfaac-dev libmp3lame-dev libtheora-dev \
        libopencore-amrnb-dev libopencore-amrwb-dev \
        libopenblas-dev libatlas-base-dev libblas-dev \
        liblapack-dev libeigen3-dev \
        libhdf5-dev protobuf-compiler \
        libprotobuf-dev libgoogle-glog-dev libgflags-dev \
        ffmpeg &&\
    pip3 install --upgrade pip &&\
    pip3 install opencv_contrib_python &&\
    cd ~ && git clone https://github.com/PINTO0309/mediapipe-bin && cd mediapipe-bin &&\
    ./v0.8.5/numpy119x/mediapipe-0.8.5_cuda102-cp36-cp36m-linux_aarch64_numpy119x_jetsonnano_L4T32.5.1_download.sh &&\
    pip3 install \
        numpy-1.19.4-cp36-none-manylinux2014_aarch64.whl \
        mediapipe-0.8.5_cuda102-cp36-none-linux_aarch64.whl &&\
    pip3 install opencv-python dataclasses

RUN cd ~ && git clone https://github.com/Kazuhito00/mediapipe-python-sample && \
    cd mediapipe-python-sample

RUN apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran &&\
    pip3 install -U pip testresources setuptools==49.6.0 &&\
    pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11 &&\
    pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v46 tensorflow 


