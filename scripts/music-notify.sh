#!/bin/bash

NOTIFICATION_ID=27072

playerctl metadata --follow 2>/dev/null | while read -r line; do

    STATUS=$(playerctl status 2>/dev/null)

    if [ "$STATUS" = "Playing" ]; then

        TITLE=$(playerctl metadata title 2>/dev/null)
        AUTHOR=$(playerctl metadata artist 2>/dev/null)
        
        # Construir el mensaje
        MESSAGE="$TITLE"
        
        if [ -n "$AUTHOR" ]; then
            MESSAGE="$MESSAGE\n$AUTHOR"
        fi

        dunstify -r $NOTIFICATION_ID -u low "Now Playing 🖸" "$MESSAGE"
    fi
done
