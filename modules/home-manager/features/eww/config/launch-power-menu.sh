#!/usr/bin/env bash

config="$EWW_CONFIG_DIR"
pkill walker

monitors=$(hyprctl monitors -j | jq length)
((monitors--))

monitor=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')

eww --config="$config" active-windows | grep -q power
[[ $? == 0 ]] && {
    eww --config "$config" close power
    echo "closed power"
    exit 0
}

echo "opening power menu"
eww --config "$config" open power --screen $monitor
echo "pwd $(pwd)"

if [[ $? == 0 ]]; then
    echo "power menu opened"
    hyprctl keyword bindn ,L,exec,hyprlock
    hyprctl keyword bindn ,E,exec,"hyprctl reload; EWW_CONFIG_DIR=$config bash $config/scripts/confirm_prompt.sh 'Are you sure you want to exit to TTY?' 'hyprctl dispatch exit'"
    hyprctl keyword bindn ,R,exec,"hyprctl reload; EWW_CONFIG_DIR=$config bash $config/scripts/confirm_prompt.sh 'Are you sure you want to reboot?' 'systemctl reboot'"
    hyprctl keyword bindn ,S,exec,"hyprctl reload; EWW_CONFIG_DIR=$config bash $config/scripts/confirm_prompt.sh 'Are you sure you want to shut down?' 'systemctl shutdown'"
    hyprctl keyword bindn ,Escape,exec,"hyprctl reload; EWW_CONFIG_DIR=$config eww --config $config close power"
    echo "set keybinds"
    while true; do
        sleep 0.5
        echo "looping"
        eww --config "$config" active-windows | grep -q "power"
        if [[ $? -ne 0 ]]; then
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
