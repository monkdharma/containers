#!/bin/bash
set -e  # Exit the script if any statement returns a non-true return value

# ---------------------------------------------------------------------------- #
#                          Function Definitions                                #
# ---------------------------------------------------------------------------- #

# Start nginx service
start_nginx() {
    echo "Starting Nginx service..."
    service nginx start
}

# Execute script if exists
execute_script() {
    local script_path=$1
    local script_msg=$2
    if [[ -f ${script_path} ]]; then
        echo "${script_msg}"
        bash ${script_path}
    fi
}

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
    if [[ $PODWISE_START_JUPYTER ]]; then
        if [[ $PODWISE_PODWISE_JUPYTER_PASSWORD ]]; then
            echo "Starting Jupyter Lab..."
            mkdir -p /workspace && \
            cd / && \
            nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.password=$PODWISE_JUPYTER_PASSWORD --ServerApp.token=$PODWISE_JUPYTER_PASSWORD --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &> /jupyter.log &
            echo "Jupyter Lab started"
        else
            echo "Starting Jupyter Lab..."
	    nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token="" --ServerApp.password="" --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &> /jupyter.log &
            echo "Jupyter Lab started"
	fi
    fi
}

# ---------------------------------------------------------------------------- #
#                               Main Program                                   #
# ---------------------------------------------------------------------------- #

start_nginx

execute_script "/pre_start.sh" "Running pre-start script..."

echo "Pod Started"

setup_ssh
start_jupyter

execute_script "/post_start.sh" "Running post-start script..."

echo "Start script(s) finished, pod is ready to use."

sleep infinity
