#!/bin/bash

case $1 in
	up)
		pactl set-sink-volume @DEFAULT_SINK@ +5%;;
	down)
		pactl set-sink-volume @DEFAULT_SINK@ -5%;;
	mute)
		pactl set-sink-mute @DEFAULT_SINK@ toggle;;
esac

pkill -SIGUSR1 i3status

dunstify -h string:x-dunst-stack-tag:volume "Volume 󰕾 " "$(pamixer --get-volume-human)"
