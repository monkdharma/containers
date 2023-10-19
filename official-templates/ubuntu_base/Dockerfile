ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 
FROM $BASE_IMAGE
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV arch=x86_64

# install python
ARG PYTHON_VERSION=3.9
RUN apt-get update && apt-get install --no-install-recommends -y \
  git \
  git-lfs \
  python3-dev \
  python3-venv \
  python3-pip && \
  apt-get clean

# install pytorch
ARG TORCH_VERSION=2.0.1
ARG CUDATOOLKIT_VERSION=cu118
RUN pip3 install --no-cache-dir torch==$TORCH_VERSION torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/$CUDATOOLKIT_VERSION;

# install jupyterlab
RUN pip3 install --no-cache-dir jupyterlab ipywidgets ipykernel matplotlib

# install tensorflow
ARG TENSORFLOW_VERSION=1.15.5
RUN pip3 install --user --upgrade tensorflow

