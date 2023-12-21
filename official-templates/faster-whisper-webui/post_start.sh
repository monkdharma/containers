#!/bin/bash
cd /workspace/faster-whisper-webui
python3 app.py --input_audio_max_duration -1 --server_name 127.0.0.1 --auto_parallel True
