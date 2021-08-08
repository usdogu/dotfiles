systemctl --user import-environment DISPLAY &
setxkbmap tr &
rootblocks &
emacs --daemon &
sxhkd -c /home/dogu/.config/sxhkd/sxhkdrc &
xrdb -merge .Xresources &
exec dbus-launch --sh-syntax --exit-with-session dwm
