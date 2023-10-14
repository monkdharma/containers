#!/bin/bash
cd /workspace/text-generation-webui/
python3 server.py --listen --share  --auto-devices --gpu-memory 10240MiB &
