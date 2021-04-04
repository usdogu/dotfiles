#!/bin/bash

if [ "$(ps aux | grep -v grep | grep -i noti | awk -F "/" '{print $4}')" == "notification-daemon" ]; then
	killall notification-da
	dunst &
fi

if [ "$(ps aux | grep -v grep | grep -i nm | awk '{print $11}')" != "nm-applet" ]; then
	nm-applet &
fi

if [ "$(ps aux | grep -v grep | grep -i xfce4-clipman | awk '{print $11}')" != "xfce4-clipman" ]; then
	xfce4-clipman &
fi
/usr/libexec/polkit-gnome-authentication-agent-1 &
dunst &
clipit &
feh --bg-scale /home/dogu/Masaüstü/DİĞER/wallhaven-4g5r8l_1024x768.png
~/.config/polybar/launch.sh
#xrandr --output HDMI-1 --mode 1280x720
