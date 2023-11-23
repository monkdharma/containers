FROM ubuntu:22.04 
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  stress-ng  && \
  apt-get clean

ENTRYPOINT ["/usr/bin/stress-ng"]
