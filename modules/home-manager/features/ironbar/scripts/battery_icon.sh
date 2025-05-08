#!/usr/bin/env bash

status="$(cat /sys/class/power_supply/"$1"/status)"

[[ "$status" == "Charging" ]] && {
    echo " "
    exit 0
}

battery=$(cat /sys/class/power_supply/"$1"/capacity)

if [[ $battery -lt 21 ]]; then
    echo " "
elif [[ $battery -lt 41 ]]; then
    echo " "
elif [[ $battery -lt 61 ]]; then
    echo " "
elif [[ $battery -lt 81 ]]; then
    echo " "
else
    echo " "
fi
