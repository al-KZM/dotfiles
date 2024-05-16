!/usr/bin/env sh
# Profile file. Runs on login.

# PATH
export PATH=$PATH:/usr/share/pycharm-community-2020.3.3/bin
export PATH=$PATH:/usr/share
# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# Adds python site packages
export PATH="$PATH:$HOME/.local/lib/python3.9/site-packages"
export PATH="$PATH:$HOME/.config/scripts/"
export PATH="$PATH:$HOME/.local/bin/"

# Add sixgill additionals (https://bitbucket.org/sixgill/sixgill/src/master/) to pythonpath
export PYTHONPATH="$PYTHONPATH:$HOME/.local/lib/python3.9/site-packages/sixgill-additionals/"


export DOCUMENTS="$HOME/documents"
export DOWNLOADS="$HOME/Downloads"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FILE="vifm"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"

# ZSH specific
export ZDOTDIR="$HOME/.config/zsh"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

mpd >/dev/null 2>&1 &

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x startx >/dev/null && exec startx

sleep 1
autorandr -c
bash $HOME/.config/wallpaper/set_feh_bg.sh

# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

sudo mount /dev/sda1 /mnt/usb 2>/dev/null

export MAIL_USERNAME="eyalchoc.secondary@gmail.com"

# 3 screens layout
xrandr --output eDP-1 --mode 1920x1080 --pos 4480x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-1-8 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-1-9 --mode 2560x1080 --pos 0x0 --rotate normal

# Avoid Gstreamer warning in shells when running howdy
# https://wiki.archlinux.org/title/Howdy#GStreamer_warnings_in_shell
export OPENCV_LOG_LEVEL=ERROR
