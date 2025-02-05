[[ -f ~/.shell_init_verbose ]] && echo "Running config bash_profile"

if [[ -d "/.autodirect/mtrsysgwork/eshukrun" ]]; then
    HOME_DIR="/.autodirect/mtrsysgwork/eshukrun"
elif [[ -d "/.autodirect/swgwork/eshukrun" ]]; then
    HOME_DIR="/.autodirect/swgwork/eshukrun"
else
    HOME_DIR="/labhome/eshukrun"
fi
echo "HOME_DIR is $HOME_DIR"
export HOME_DIR
export CONFIG_DIR="$HOME_DIR/.config"

[[ -f "$CONFIG_DIR/secrets" ]] && source "$CONFIG_DIR/secrets"

if [[ -f "$CONFIG_DIR/commonprofile" ]]; then
    source $CONFIG_DIR/commonprofile
else
    [[ -f ~/.shell_init_verbose ]] && echo "Can't find commonprofile"
fi

[[ -z SSH_CLIENT ]] && exit 0

if [ -f /bin/zsh ]; then
    exec /bin/zsh -l
else
    [ -f "$CONFIG_DIR/bashrc" ] && source $CONFIG_DIR/bashrc
fi

