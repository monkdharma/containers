#!/bin/bash
 
# Define color codes
WHITE='\033[1;37m'
GREEN='\033[1;32m'
BLUE='\033[1;34m' # Adding blue for a better look
YELLOW='\033[1;33m'
RESET='\033[0m'
 
# Function to print colored lines
print_line() {
  local color="$1"
  local text="$2"
  printf "${color}%s${RESET}\n" "$text"
}
 
# Print the welcome message in light green
echo -e "${GREEN}"
cat << "EOF"
__________          ._____      __.__
\______   \____   __| _/  \    /  \__| ______ ____
 |     ___/  _ \ / __ |\   \/\/   /  |/  ___// __ \
 |    |  (  <_> ) /_/ | \        /|  |\___ \\  ___/
 |____|   \____/\____ |  \__/\  / |__/____  >\___  >
                     \/       \/          \/     \/
EOF
echo -e "${RESET}Unleash the Power, Connect the Future!\n"
 
# Header for Podwise
print_line "${WHITE}" "+-------------------------------Podwise--------------------------------+"
print_line "${WHITE}" "| Directory  | Name       | Speed  | Description                       |"
print_line "${WHITE}" "|------------|------------|--------|-----------------------------------|"
print_line "${WHITE}" "| /workspace | Workspace  | Normal | Used for storing work-related files.|"
print_line "${WHITE}" "+---------------------------------------------------------------------+"
 
# System information checks (CPU, Memory, GPU, Storage)
print_line "${BLUE}" "# System information checks (CPU, Memory, GPU, Storage)"
 
# Check if cgroup v2 is used
print_line "${GREEN}" "CPU ：$PODWISE_CPU_COUNT cores"
print_line "${GREEN}" "Memory：`expr $PODWISE_MEM_GB / 1024 / 1024 / 1024` GB"

# GPU information
if type nvidia-smi >/dev/null 2>&1; then
  gpu=$(nvidia-smi -i 0 --query-gpu=name,count --format=csv,noheader)
  print_line "${GREEN}" "GPU ：$gpu"
fi
 
# Footer and instructions
print_line "${WHITE}" "+---------------------------------------------------------------------------------+"
print_line "${YELLOW}" "*Note:"
echo -e "1. The system disk is small; please store large data on the workspace or network disk, unaffected by system resets."
echo -e "2. To clean the system disk, please refer to: https://www.podwise.co/docs/qa/"
 
# GPU-specific environment variable settings
if [[ "$gpu" == *"A4000"* ]] || [[ "$gpu" == *"A5000"* ]]; then
    if ! grep -q "NCCL_P2P_LEVEL" /etc/profile; then
        echo "export NCCL_P2P_LEVEL=NVL" >> /etc/profile
        source /etc/profile
    fi
fi
 
# Disable sudo alias, if it was set
unalias sudo 2>/dev/null || true
 
# End of the script
