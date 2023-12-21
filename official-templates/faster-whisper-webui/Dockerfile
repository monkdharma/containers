FROM podwise/miniconda:ubuntu22.04-python3.10-cuda11.8 
WORKDIR /workspace
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  libgl1 \
  libglib2.0-0 \
  net-tools \
  ffmpeg && \
  apt-get clean

# insall faster-whisper-webui
RUN git clone https://huggingface.co/spaces/aadnk/faster-whisper-webui && \
    cd faster-whisper-webui/ && \
    pip install -r requirements.txt && pip install -r requirements-fasterWhisper.txt && \
    pip3 install ffprobe

COPY --from=proxy nginx.conf /etc/nginx/nginx.conf

# Start Scripts
COPY post_start.sh /post_start.sh
COPY --from=scripts start.sh /
COPY --from=scripts podwise_info.sh /etc/podwise-motd
COPY --from=scripts nvidia_entrypoint.sh /opt/nvidia/
RUN chmod +x /start.sh && chmod +x /opt/nvidia/nvidia_entrypoint.sh && echo "source /etc/podwise-motd" >> ~/.bashrc

CMD ["/start.sh"]
