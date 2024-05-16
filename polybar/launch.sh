THEME="nicomazz"

POLYBAR_DIR="$CONFIG_DIR/polybar"
POLYBAR_VERBOSE="error"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
#fi


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

polybar top -l $POLYBAR_VERBOSE -c $CONFIG_DIR/polybar/config.ini &
