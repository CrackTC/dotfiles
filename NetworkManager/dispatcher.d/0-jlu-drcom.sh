#!/bin/sh

# Auto login jlu drcom while connected to jlu network

if [ "$2" = "up" ]; then
    killall jlu-drcom
    /home/chen/repos/dr-jlu-linux/bin/jlu-drcom&
fi
