#!/bin/bash
# Increment the brightness by $1

current=$(cat "/sys/class/backlight/intel_backlight/brightness")
if [[ $current != 0 ]] ; then
    echo 0 > /sys/class/backlight/intel_backlight/brightness 2>/dev/null
else
    echo 50 > /sys/class/backlight/intel_backlight/brightness 2>/dev/null
fi

