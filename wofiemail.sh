#!/usr/bin/env bash

CONFIG_PATH=~/.thunderbird/profiles.ini

choice=$(awk -F "=" '/Name/ { print $2 }' $CONFIG_PATH | sort | wofi --dmenu --prompt "Select a profile...")

if [ "$choice" != "" ]; then
    thunderbird -P $choice &
else
    echo "closed with no selection."
    false
fi
