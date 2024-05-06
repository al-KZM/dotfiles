#!/bin/sh
s=$(cat $HOME/.config/wallpaper/downloading.state)

if [ "$s" == 1 ]; then
    echo "Script already running, exiting" 1>&2
    exit 1
fi

rm $HOME/.config/wallpaper/wallpaper.png
rm $HOME/.config/wallpaper/infos/wallpaper.png.current

cp $HOME/.config/wallpaper/tomorrow.png $HOME/.config/wallpaper/wallpaper.png
cp $HOME/.config/wallpaper/infos/tomorrow.png.current $HOME/.config/wallpaper/infos/wallpaper.png.current

feh --no-fehbg --bg-scale "$HOME/.config/wallpaper/wallpaper.png" >> $HOME/.config/wallpaper/output.log 2> $HOME/.config/wallpaper/error.log

python "$HOME/.config/wallpaper/download_random.py" >> $HOME/.config/wallpaper/output.log 2> $HOME/.config/wallpaper/error.log &
