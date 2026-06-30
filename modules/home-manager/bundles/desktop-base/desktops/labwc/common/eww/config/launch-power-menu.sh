#!/usr/bin/env bash

eww active-windows | grep -q power
[[ $? == 0 ]] && {
    eww close-all
    exit 0
}

eww open closer-window
eww open power

if [[ $? == 0 ]]; then
    while true; do
        sleep 0.5
        eww active-windows | grep -q "power"
        if [[ $? -ne 0 ]]; then
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
