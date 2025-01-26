# Init script for all nvidia environment
export NVIDIA_CONFIG_DIR="$CONFIG_DIR/nvidia"

# This should be first
source $NVIDIA_CONFIG_DIR/nvenv

[[ -f $NVIDIA_CONFIG_DIR/functions.sh ]] && source $NVIDIA_CONFIG_DIR/functions.sh
[[ -f $NVIDIA_CONFIG_DIR/nvaliases ]] && source $NVIDIA_CONFIG_DIR/nvaliases
