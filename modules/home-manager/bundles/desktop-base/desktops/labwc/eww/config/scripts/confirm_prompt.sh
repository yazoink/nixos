#!/usr/bin/env bash

echo "confirm_prompt.sh"
config=$EWW_CONFIG_DIR
eww --config "$config" close power
eww --config "$config" open confirm --arg thing="$1" --arg action="$2"

if [[ $? == 0 ]]; then
    echo "confirm prompt opened"
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "confirm"
        if [[ $? != 0 ]]; then
            hyprctl reload
            echo "hyprland reloaded"
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
