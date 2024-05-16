#!/bin/sh
s=$(cat $CONFIG_DIR/wallpaper/downloading.state)

if [ "$s" == 1 ]; then
    echo "Script already running, exiting" 1>&2
    exit 1
fi

rm $CONFIG_DIR/wallpaper/wallpaper.png
rm $CONFIG_DIR/wallpaper/infos/wallpaper.png.current

cp $CONFIG_DIR/wallpaper/tomorrow.png $CONFIG_DIR/wallpaper/wallpaper.png
cp $CONFIG_DIR/wallpaper/infos/tomorrow.png.current $CONFIG_DIR/wallpaper/infos/wallpaper.png.current

feh --no-fehbg --bg-scale "$CONFIG_DIR/wallpaper/wallpaper.png" >> $CONFIG_DIR/wallpaper/output.log 2> $CONFIG_DIR/wallpaper/error.log

python "$CONFIG_DIR/wallpaper/download_random.py" >> $CONFIG_DIR/wallpaper/output.log 2> $CONFIG_DIR/wallpaper/error.log &
