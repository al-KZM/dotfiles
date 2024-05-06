#!/bin/bash
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ) $(readlink -f $0)"
screens_nb=`xrandr | grep 'HDMI\|DP' | grep -v 'disconnected' | wc -l`

case $screens_nb in
    1)
        xrandr --auto
        ;;
    2)
        bash /home/x41/.config/.screenlayout/dual.sh
        ;;
    3)
        bash /home/x41/.config/.screenlayout/sixgill_right.sh
        ;;
    4)
        bash /home/x41/.config/.screenlayout/4mon.sh
        ;;
    *)
        echo "unsupported monitors layout, please edit $script_path to add your configuration"
        ;;
esac

