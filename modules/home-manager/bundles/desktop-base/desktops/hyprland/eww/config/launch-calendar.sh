#!/usr/bin/env bash

config="$EWW_CONFIG_DIR"

monitors=$(hyprctl monitors -j | jq length)
((monitors--))

monitor=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')

eww --config="$config" active-windows | grep -q calendar-window
[[ $? == 0 ]] && {
    hyprctl reload
    eww --config "$config" close calendar-window
    exit 0
}

eww --config "$config" open calendar-window --screen $monitor

if [[ $? == 0 ]]; then
    hyprctl keyword bindn ,Escape,exec,"hyprctl reload; EWW_CONFIG_DIR=$config eww --config $config close calendar-window"
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "calendar-window"
        if [[ $? -ne 0 ]]; then
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
