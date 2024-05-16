#!/bin/bash

#!/usr/bin/env bash
export FIFO_UEBERZUG="/tmp/lf-ueberzug-${PPID}"

function cleanup {
	rm "$FIFO_UEBERZUG" 2>/dev/null
	pkill -P $$
}

mkfifo "$FIFO_UEBERZUG"
trap cleanup EXIT
tail --follow "$FIFO_UEBERZUG" | ueberzug layer --silent --parser bash &

$CONFIG_DIR/lf/image.sh draw ~/images/belette.jpeg 30 1 30 30

