#!/usr/bin/env bash

config="$EWW_CONFIG_DIR"

eww --config="$config" active-windows | grep -q power
[[ $? == 0 ]] && {
    eww --config "$config" close-all
    exit 0
}

eww --config "$config" open closer-window
eww --config "$config" open power
echo "pwd $(pwd)"

if [[ $? == 0 ]]; then
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "power"
        if [[ $? -ne 0 ]]; then
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
