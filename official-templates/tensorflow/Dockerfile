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

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf
COPY --from=scripts start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
