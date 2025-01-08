#!/bin/sh
if [ "$1" == "enter" ]; then
    notify-send "Normal Mode" "Entered Vim Normal Mode"
elif [ "$1" == "exit" ]; then
    notify-send "Normal Mode" "Exited Vim Normal Mode"
fi

