#!/bin/bash

playerctl metadata --follow --format "{{title}} {{artist}}" 2>/dev/null | while read -r line; do
    dunstify -r 27072 -u low "Now Playing" "$(playerctl metadata --format '{{title}} {{#artist}}\nby {{artist}}{{/artist}}')"
done
