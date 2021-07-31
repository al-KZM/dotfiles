#!/bin/sh
readonly ID_PREVIEW="preview"


main() {
    img_path=$2
    offset_y=4
    preview_win_width=$3
    preview_win_start_pos=$5
    y_mid=$6
    y_pos+=$(($4 + $offset_y/2))
    x_pos=$preview_win_width
    width=$preview_win_width
    height=$(($y_mid - $offset_y))

	case "$1" in
		"clear")
			declare -p -A cmd=([action]=remove [identifier]="$ID_PREVIEW") \
				> "$FIFO_UEBERZUG"
			;;
		"draw")
			declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW" \
                [x]="$x_pos" [y]="$y_pos"\
                [scaler]=cover [scaling_position_x]=1 [scaling_position_y]=1 \
                [width]="$width" [height]="$height"\
                [scaling_position_x]=0 [scaling_position_y]=0\
				 [path]="$img_path") > "$FIFO_UEBERZUG"
            if [ "$img_path" != $(cat $LAST_PIC_FILE)] ; then
                echo "$img_path" > $LAST_PIC_FILE
                lf -remote "send reload"
            fi
			;;
		"*") echo "Unknown command: '$1', '$2'" ;;
	esac
}

main "$@"
