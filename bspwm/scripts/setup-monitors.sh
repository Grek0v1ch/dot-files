#! /bin/bash

# В случае отключения монитора нужно удалить все рабочие столы на нем
desktops=$(bspc query -D -m HDMI-1 --names)
for d in $desktops; do
    bspc desktop "$d" -r
done
# И удалить сам монитор
bspc monitor HDMI-1 -r

xrandr --output eDP-1 --mode 1920x1080
if xrandr -q | grep 'HDMI-1 connected'; then
	mons -e right
	xrandr --output HDMI-1 --primary --mode 2560x1440 --right-of eDP-1
	bspc wm -O HDMI-1 eDP-1
	bspc monitor HDMI-1 -d 1 2 3 4 5 6
	bspc monitor eDP-1 -d 7 8 9
else
	xrandr --output eDP-1 --primary
	mons -o
	bspc monitor eDP-1 -d 1 2 3 4 5 6
fi
