#!/bin/bash

zoom=8

stylus_id=$(xsetwacom --list devices | grep "stylus"| tr -s '\t' ' ' | cut -d ' ' -f 7)
eraser_id=$(xsetwacom --list devices | grep "eraser"| tr -s '\t' ' ' | cut -d ' ' -f 7)

xsetwacom set $stylus_id mode relative
xsetwacom set $stylus_id area 0 0 $(( 20320*$zoom )) $(( 16240*$zoom ))

xsetwacom set $eraser_id mode relative
xsetwacom set $eraser_id area 0 0 $(( 20320*$zoom )) $(( 16240*$zoom ))


