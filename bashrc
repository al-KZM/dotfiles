#!/usr/bin/env bash
#  _________________________________________ 
# / Are you sure you don't want to edit the \
# \ zshrc instead ??                        /
#  ----------------------------------------- 
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

[[ -n "$CONFIG_DIR" ]] && bash $CONFIG_DIR/scripts/sync_config.sh

#stty -ixon # Disable ctrl-s and ctrl-q.
#shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

#HISTSIZE= HISTFILESIZE= # Infinite history.

#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Load aliases and shortcuts if existent.
[ -f "$CONFIG_DIR/shortcutrc" ] && source "$CONFIG_DIR/shortcutrc"
[ -f "$CONFIG_DIR/aliasrc" ] && source "$CONFIG_DIR/aliasrc"

# Run init commands in the shell
#neofetch

#setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
