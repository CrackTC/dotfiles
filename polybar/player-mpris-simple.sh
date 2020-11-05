#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
title=""
if [ "$player_status" = "Playing" ]; then
    title="🎵 $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    title="⏸️ $(playerctl metadata title)"
fi
len=${#title}
if [ $len -gt 15 ]
then
  title="${title:0:12}..."
fi
echo ${title}
