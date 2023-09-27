FROM nvidia/cuda:12.0.0-devel-ubuntu22.04
LABEL image.authors="Dharma"
WORKDIR /workspace

RUN apt update && apt install -y \
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
  nginx \
  && pip3 install \
  torch \
  torchvision \
  torchaudio \
  jupyterlab \
  ipywidgets \
  ipykernel \
  matplotlib \
  && apt clean

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui \
  && cd stable-diffusion-webui; \
  pip install -r requirements_versions.txt; \
  pip install -r requirements.txt

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf

# Start Scripts
COPY pre_start.sh /pre_start.sh
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
