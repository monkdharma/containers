#!/bin/bash
cd /workspace/text-generation-webui/
python3 server.py --listen $PODWISE_OOBABOOGA_ARGS &
