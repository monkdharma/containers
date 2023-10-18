FROM nvidia/cuda:12.0.0-devel-ubuntu22.04
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  git \
  python3.10 \
  python3.10-venv \
  libgl1 \
  libglib2.0-0 \
  pip \
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
COPY Cyberpunk-Anime-Diffusion/Cyberpunk-Anime-Diffusion.safetensors /workspace/stable-diffusion-webui/models/Stable-diffusion/
RUN mkdir /workspace/stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper
COPY Stable-Diffusion-Webui-Civitai-Helper /workspace/stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper/
COPY --from=proxy nginx.conf /etc/nginx/nginx.conf

# Start Scripts
COPY pre_start.sh /pre_start.sh
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
