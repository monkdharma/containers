ARG BASE_IMAGE
FROM ${BASE_IMAGE}
ARG MINICONDA
WORKDIR /workspace
ENV TZ=Asia/Shanghai
ENV arch=x86_64
ENV DEBIAN_FRONTEND=noninteractive

# install python
RUN apt-get update && apt-get install --no-install-recommends -y \
  git \
  git-lfs \
  openssh-server \
  wget \
  curl \
  vim \
  nginx \
  python3-dev \
  python3-venv \
  python3-pip && \
  apt-get clean

# install Miniconda
RUN mkdir -p ~/miniconda3 && \
    wget ${MINICONDA} -O ~/miniconda3/miniconda.sh && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
    rm -rf ~/miniconda3/miniconda.sh && \
    ~/miniconda3/bin/conda init bash
# install jupyterlab
RUN pip3 install --no-cache-dir jupyterlab ipywidgets ipykernel matplotlib

COPY --from=scripts start.sh /
COPY --from=scripts podwise_info.sh /etc/podwise-motd 
COPY --from=scripts nvidia_entrypoint.sh /opt/nvidia/
RUN chmod +x /start.sh && chmod +x /opt/nvidia/nvidia_entrypoint.sh && echo "source /etc/podwise-motd" >> ~/.bashrc 

CMD ["/start.sh"]

