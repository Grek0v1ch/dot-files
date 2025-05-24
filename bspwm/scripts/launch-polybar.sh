#! /bin/bash

pkill polybar &
if xrandr -q | grep 'HDMI-1 connected'; then
	MONITOR=HDMI-1 polybar main &> /dev/null &
	MONITOR=eDP-1 polybar second &> /dev/null &
else
	MONITOR=eDP-1 polybar main &> /dev/null &
fi
