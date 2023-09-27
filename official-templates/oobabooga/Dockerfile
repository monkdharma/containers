FROM nvidia/cuda:12.0.0-devel-ubuntu22.04
WORKDIR /workspace
ARG HF_TOKEN
ENV HF_TOKEN=${HF_TOKEN}
RUN echo "$HF_TOKEN"
RUN apt update && apt install -y \
  wget \
  git \
  python3.10 \
  python3.10-venv \
  libgl1 \
  libglib2.0-0 \
  pip \
  net-tools \
  vim \
  openssh-server \
  nginx \
  curl \
  && pip3 install \
  torch \
  torchvision \
  torchaudio \
  jupyterlab \
  ipywidgets \
  ipykernel \
  matplotlib \
  && apt clean
  
RUN git clone https://github.com/oobabooga/text-generation-webui \
  && cd text-generation-webui; \
  pip install -r requirements.txt

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf
COPY meta_llama2 /workspace/text-generation-webui/models/

# Start Scripts
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
