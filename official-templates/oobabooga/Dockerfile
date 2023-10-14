FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 
WORKDIR /workspace
RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  git \
  git-lfs \
  python3.10 \
  python3.10-venv \
  python3-pip \
  libgl1 \
  libglib2.0-0 \
  net-tools \
  vim \
  openssh-server \
  nginx \
  curl && \
  apt-get clean
RUN pip3 install --upgrade pip setuptools && \
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install jupyterlab ipywidgets ipykernel matplotlib
  
RUN git clone https://github.com/oobabooga/text-generation-webui && \
    cd text-generation-webui && \
    pip3 install -r requirements.txt

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf

# Start Scripts
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
RUN chmod +x /start.sh && apt-get clean && rm -rf /var/lib/apt-get/lists/*

CMD ["/start.sh"]
