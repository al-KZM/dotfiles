#!/bin/bash
# Increment the brightness by $1

current=$(cat "/sys/class/backlight/intel_backlight/brightness")
echo $(( $current - $1 )) > /sys/class/backlight/intel_backlight/brightness 2>/dev/null

