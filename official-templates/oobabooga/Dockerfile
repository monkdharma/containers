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

# install Miniconda
RUN mkdir -p ~/miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
    rm -rf ~/miniconda3/miniconda.sh && \
    ~/miniconda3/bin/conda init bash

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf
COPY meta_llama2 /workspace/text-generation-webui/models/

# Start Scripts
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
COPY --from=scripts podwise_info.sh /etc/podwise-motd
COPY --from=scripts nvidia_entrypoint.sh /opt/nvidia/
RUN chmod +x /start.sh && chmod +x /opt/nvidia/nvidia_entrypoint.sh && echo "source /etc/podwise-motd" >> ~/.bashrc

CMD ["/start.sh"]
