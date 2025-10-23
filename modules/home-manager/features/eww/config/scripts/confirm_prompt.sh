#!/usr/bin/env bash

echo "confirm_prompt.sh"
config="$(echo $EWW_CONFIG_DIR)"
monitor=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')
eww --config "$config" close power
eww --config "$config" open confirm --arg screen=$monitor --arg thing="$1" --arg action="$2"

if [[ $? == 0 ]]; then
    echo "confirm prompt opened"
    sleep 0.6
    hyprctl keyword bindn ,Y,exec,"hyprctl reload; $2; eww --config $config close confirm"
    hyprctl keyword bindn ,N,exec,"hyprctl reload; eww --config $config close confirm"
    hyprctl keyword bindn ,"Escape,exec,hyprctl reload; eww --config $config close confirm"
    echo "set keybinds"
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "confirm"
        if [[ $? != 0 ]]; then
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
