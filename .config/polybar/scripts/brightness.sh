#!/bin/bash
# BRIGHTNESSCTL POLYBAR BRIDGE, AUTHOR ON https://t.me/UsmanAga
if [[ "$(brightnessctl | grep class | awk -F "'" '{print $4}')" == "backlight" ]]; then
	case $1 in
	get ) 
		echo """  $(brightnessctl | grep Current | cut -d" " -f4- | sed 's/(//g; s/)//g')"""
		polybar-msg hook backlight 1 > /dev/null
	;;
	up )
		brightnessctl set +10%
		polybar-msg hook backlight 1 > /dev/null
	;;
	down )
		if [[ "$(brightnessctl | grep Current | cut -d" " -f4- | sed 's/(//g; s/)//g; s/%//g')" -le "10" ]]; then
			polybar-msg hook backlight 1 > /dev/null
		else
			brightnessctl set 10%-
			polybar-msg hook backlight 1 > /dev/null
		fi
	;;
	esac
fi

