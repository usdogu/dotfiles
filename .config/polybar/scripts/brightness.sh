#!/bin/bash
# BRIGHTNESSCTL POLYBAR BRIDGE, AUTHOR ON https://t.me/O5M4NA6A
if [ "$(brightnessctl | grep class | awk -F "'" '{print $4}')" == "backlight" ]
	then
		case $1 in
		get ) 
			echo """  $(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}')"""
			polybar-msg hook backlight 1 > /dev/null
		;;
		up )
			brightnessctl set +10%
			polybar-msg hook backlight 1 > /dev/null
		;;
		down )
			if [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "1%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "2%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "3%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "4%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "5%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "6%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "7%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "8%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "9%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
			elif [ "$(brightnessctl | grep Current | awk -F ")" '{print $1}' |  awk -F "(" '{print $2}' )" == "10%" ]
				then
					echo ""
					polybar-msg hook backlight 1 > /dev/null
				else
					brightnessctl set 10%-
					polybar-msg hook backlight 1 > /dev/null
			fi
		;;
		esac
	else
		echo " "
fi

