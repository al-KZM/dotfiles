#!/bin/bash
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ) $(readlink -f $0)"
screens_nb=`xrandr | grep 'HDMI\|DP' | grep -v 'disconnected' | wc -l`

case $screens_nb in
    1)
        xrandr --auto
        ;;
    2)
        bash $CONFIG_DIR/.screenlayout/dual.sh
        ;;
    3)
        bash $CONFIG_DIR/.screenlayout/3mon.sh
        ;;
    *)
        echo "unsupported monitors layout, please edit $script_path to add your configuration"
        ;;
esac

