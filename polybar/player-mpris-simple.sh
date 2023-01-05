#!/bin/sh

player_status=$(playerctl -p spotify,edge status 2> /dev/null)
title=""
if [ "$player_status" = "Playing" ]; then
    title=" $(playerctl -p spotify,edge metadata title)"
elif [ "$player_status" = "Paused" ]; then
    title=" $(playerctl -p spotify,edge metadata title)"
fi
len=${#title}
if [ $len -gt 30 ]
then
  title="${title:0:29}…"
fi
echo ${title}
