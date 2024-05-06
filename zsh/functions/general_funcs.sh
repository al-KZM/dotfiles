# Functions that aren't dependent of ZSH

cd() {
    echo "$PWD" > $LAST_LAST_DIR_FILE
    if (( $+2 )); then
        builtin cd "$@"
    else
        if [ -f "$1" ]; then
            echo "${yellow}cd ${1:h}${NC}" >&2
            builtin cd "${1:h}"
        else
            builtin cd "${@}"
        fi
    fi
    echo "$PWD" > $LAST_DIR_FILE
}

function lcd(){
    cd `cat $LAST_LAST_DIR_FILE`
}

# automatic ls after a cd and remap actual cd to it
function clip(){
    xclip -sel clip < $1
}

function add_dotfile(){
    echo `realpath $1` >> $HOME/.config/dotfiles_bkp/dotfiles_list.txt
}

startx() {
    exec =startx "$@"
}
