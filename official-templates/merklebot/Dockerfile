FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  git \
  git-lfs \
  python3-dev \
  python3-venv \
  python3-pip \
  curl \
  libgl1 \
  libglib2.0-0 \
  openssh-server \
  net-tools \
  vim \
  nginx  \
  locales && \
  locale-gen en_US.UTF-8 && \
  update-locale LANG=en_US.UTF-8 && \
  apt-get clean

RUN pip3 install --upgrade pip setuptools && \
    pip3 install jupyterlab ipywidgets ipykernel matplotlib && \
    pip3 install onnx onnxruntime-gpu opencv-python

# install pytorch
ARG TORCH_VERSION=2.0.1
ARG CUDATOOLKIT_VERSION=cu118
RUN pip3 install --no-cache-dir torch==$TORCH_VERSION torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/$CUDATOOLKIT_VERSION;

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
