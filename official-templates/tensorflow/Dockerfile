FROM tensorflow/tensorflow:2.14.0-jupyter
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  git \
  curl \
  libgl1 \
  libglib2.0-0 \
  openssh-server \
  net-tools \
  vim \
  nginx && \
  apt-get clean

RUN pip3 install --upgrade pip setuptools && \
    pip3 install jupyterlab ipywidgets ipykernel matplotlib

# install Miniconda
RUN mkdir -p ~/miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
    rm -rf ~/miniconda3/miniconda.sh && \
    ~/miniconda3/bin/conda init bash
COPY bash.bashrc /etc/bash.bashrc
COPY --from=proxy nginx.conf /etc/nginx/nginx.conf
COPY --from=scripts podwise_info.sh /etc/podwise-motd
COPY --from=scripts start.sh /
RUN chmod +x /start.sh && echo "source /etc/podwise-motd" >> ~/.bashrc

CMD ["/start.sh"]
