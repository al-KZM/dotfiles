[[ -f ~/.shell_init_verbose ]] && echo "Running NV init"

# Init script for all nvidia environment
export NVIDIA_CONFIG_DIR="$CONFIG_DIR/nvidia"

# This should be first
source $NVIDIA_CONFIG_DIR/nvenv


source $NVIDIA_CONFIG_DIR/nvaliases
