#!/usr/bin/env bash

config="$EWW_CONFIG_DIR"

eww --config="$config" active-windows | grep -q calendar-window
[[ $? == 0 ]] && {
    eww --config "$config" close calendar-window
    exit 0
}

eww --config "$config" open closer-window
eww --config "$config" open calendar-window

if [[ $? == 0 ]]; then
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "calendar-window"
        if [[ $? -ne 0 ]]; then
            eww --config "$config" close closer-window
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
