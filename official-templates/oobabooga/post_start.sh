#!/bin/bash
cd /workspace/text-generation-webui/
python3 server.py --listen --share --model Llama-2-7b-chat-hf  --auto-devices &
