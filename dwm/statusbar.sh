#!/bin/bash

vpn(){
    status=`nordvpn status`
    if [[ $status =~ "Disconnected" ]] 
    then
        echo -e "🤞"
    else
        server=`echo $status | awk '/Current server:/ {print $3}'`
        country=`echo $status | awk '/Country:/ {print $2}'`
        #city=`echo $status | awk '/City:/ {print $NF}'`
        ip=`echo $status | awk '/Your new IP:/ {print $4}'`
        echo -e "🖏  $ip ($server - $country)"
    fi
}

dte(){
	dte="$(date +'%a %d %b - %k:%M')"
	echo -e "⌚ $dte"
}

mem(){
	mem=`free | awk '/Mem/ {printf "%d/%d MiB\n", $3 / 1024.0, $2 / 1024.0}'`
	echo -e "💾 $mem"
}

cpu(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle ) ) / (total-prevtotal) ))
	echo -e "💻 $cpu%"
}

batt(){
	capacity=`cat /sys/class/power_supply/BAT0/capacity`
	charging_status=`cat /sys/class/power_supply/BAT0/status`

	# Adapt icon to capacity
	case $capacity in
		[1-25])
			capacity_icon="🔴"
			;;
		[25-75])
			capacity_icon="🟢"
			;;
		[75-100])
			capacity_icon="✅"
			;;
	esac

	# Add charging icon
	if [ "$charging_status" == 'Charging' ];then
		status_icon="⚡" 
	else
		status_icon=""
	fi

	echo -e "$status_icon🔋 $capacity% $capacity_icon "
}

wifi(){
    if [ `cat /sys/class/net/wlp59s0/operstate` == "up" ];then
        wifi_ssid=`nmcli | grep wlp59s0 | head -n1 | awk '{print $4}'` 
        out="📶 $wifi_ssid"
    else
        out="📶"
        echo `cat /sys/class/net/wlp59s0/operstate` >> /tmp/dbg
    fi
    echo $out

}

# Statusbar loop function
while true; do
    statusbar="$(vpn) | $(wifi) | $(cpu) | $(mem) | $(batt) | $(dte)"
     padded=`python -c "print('$statusbar'.center(100).rstrip())"`
     xsetroot -name "$padded"
	 sleep 3s
done &

