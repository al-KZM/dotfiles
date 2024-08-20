[[ -f ~/.shell_init_verbose ]] && echo "Running config bash_profile"


export HOME_DIR="/.autodirect/mtrsysgwork/eshukrun"
export CONFIG_DIR="$HOME_DIR/.config"

if [[ -f "$CONFIG_DIR/commonprofile" ]]; then
    source $CONFIG_DIR/commonprofile
else
    echo "Can't find commonprofile"
fi

if [ -f /bin/zsh ]; then
    exec /bin/zsh -l
else
    [ -f "$CONFIG_DIR/bashrc" ] && source $CONFIG_DIR/bashrc
fi

