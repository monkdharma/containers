#!/bin/bash
set -e  # Exit the script if any statement returns a non-true return value

# ---------------------------------------------------------------------------- #
#                          Function Definitions                                #
# ---------------------------------------------------------------------------- #

# Setup ssh
setup_ssh() {
    if [[ $PODWISE_PUBLIC_KEY ]]; then
        echo "Setting up SSH..."
        mkdir -p ~/.ssh
        echo "$PODWISE_PUBLIC_KEY" >> ~/.ssh/authorized_keys
        chmod 700 -R ~/.ssh
        service ssh start
    fi
}


# Start jupyter lab
start_jupyter() {
    if [[ $PODWISE_JUPYTER_PASSWORD ]]; then
        echo "Starting Jupyter Lab..."
        mkdir -p /workspace && \
        cd / && \
        mkdir -p /usr/local/share/jupyter/lab/settings && \
        cat > /usr/local/share/jupyter/lab/settings/overrides.json << EOF
{
"@jupyterlab/apputils-extension:themes": {
  "theme": "JupyterLab Dark"
}
}
EOF
        nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}'  --ServerApp.token=$PODWISE_JUPYTER_PASSWORD --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &> /jupyter.log &
        echo "Jupyter Lab started"
    fi

    if [[ $PODWISE_START_JUPYTER ]]; then
        echo "Starting Jupyter Lab..."
        mkdir -p /workspace && \
        cd / && \
        mkdir -p /usr/local/share/jupyter/lab/settings && \
        cat > /usr/local/share/jupyter/lab/settings/overrides.json << EOF
{
"@jupyterlab/apputils-extension:themes": {
  "theme": "JupyterLab Dark"
}
}
EOF
        nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token="" --ServerApp.password="" --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &> /jupyter.log &
        echo "Jupyter Lab started"
    fi
}

# ---------------------------------------------------------------------------- #
#                               Main Program                                   #
# ---------------------------------------------------------------------------- #

echo "Pod Started"
setup_ssh
start_jupyter
echo "Start script(s) finished, pod is ready to use."

sleep infinity
