#!/usr/bin/env bash

config="~/.config/widgets"

eww --config "$config" close power

if [[ $? != 0 ]]; then
    echo "?"
    eww --config "$config" open power
    hyprctl keyword bindn ,L,exec,hyprlock
    hyprctl keyword bindn ,R,exec,systemctl reboot
    hyprctl keyword bindn ,S,exec,systemctl shutdown
    hyprctl keyword bindn ,Escape,exec,eww close power
    while true; do
        sleep 0.2
        eww active-windows | grep "power"
        if [[ $? != 0 ]]; then
            hyprctl reload
            exit 0
        fi
    done
fi
