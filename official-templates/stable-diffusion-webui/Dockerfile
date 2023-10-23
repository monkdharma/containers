FROM nvidia/cuda:12.0.0-devel-ubuntu22.04
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  git \
  python3.10 \
  python3.10-venv \
  python3-pip \
  libgl1 \
  libglib2.0-0 \
  openssh-server \
  net-tools \
  vim \
  nginx && \
  apt-get clean

RUN pip3 install --upgrade pip setuptools && \
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install jupyterlab ipywidgets ipykernel matplotlib

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui \
  && cd stable-diffusion-webui; \
  pip install -r requirements_versions.txt; \
  pip install -r requirements.txt

# Cache Models
RUN cd /workspace/stable-diffusion-webui && \
    git clone https://github.com/Mikubill/sd-webui-controlnet.git extensions/sd-webui-controlnet && \
    cd extensions/sd-webui-controlnet && \
    pip3 install -r requirements.txt && \
    cd /workspace/stable-diffusion-webui && \
    git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git extensions/Stable-Diffusion-Webui-Civitai-Helper && \ 
    wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth -O extensions/sd-webui-controlnet/models/control_v11p_sd15_canny.pth && \
    wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.yaml -O extensions/sd-webui-controlnet/models/control_v11p_sd15_canny.yaml && \
    wget https://huggingface.co/DGSpitzer/Cyberpunk-Anime-Diffusion/resolve/main/Cyberpunk-Anime-Diffusion.safetensors -O /workspace/stable-diffusion-webui/models/Stable-diffusion/Cyberpunk-Anime-Diffusion.safetensors && \
    wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -O /workspace/stable-diffusion-webui/models/Stable-diffusion/sd_xl_base_1.0.safetensors && \
    wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -O /workspace/stable-diffusion-webui/models/Stable-diffusion/sd_xl_refiner_1.0.safetensors

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf

# Start Scripts
COPY pre_start.sh /pre_start.sh
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
