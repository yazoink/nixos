#!/usr/bin/env bash

eww active-windows | grep -q calendar-window
[[ $? == 0 ]] && {
    eww close calendar-window
    exit 0
}

eww open closer-window
eww open calendar-window

if [[ $? == 0 ]]; then
    while true; do
        sleep 0.5
        eww active-windows | grep -q "calendar-window"
        if [[ $? -ne 0 ]]; then
            eww close closer-window
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
