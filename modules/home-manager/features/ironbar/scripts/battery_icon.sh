#!/usr/bin/env bash

status="$(cat /sys/class/power_supply/BAT0/status)"

[[ "$status" == "Charging" ]] && {
    echo " "
    exit 0
}

icons=(
    [20]=" "
    [40]=" "
    [60]=" "
    [80]=" "
)
battery=$(cat /sys/class/power_supply/BAT0/capacity)

for icon in "${!icons[@]}"; do
    [[ $battery < $icon ]] && {
        echo "${icons[$icon]}"
        exit 0
    }
done
echo " "

