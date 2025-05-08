#!/usr/bin/env bash

# Read both status and capacity in a single subshell to reduce I/O
read -r status capacity < <(
    echo "$(cat /sys/class/power_supply/"$1"/status) $(cat /sys/class/power_supply/"$1"/capacity)"
)

if [[ $status == "Charging" ]]; then
    echo " "
    exit 0
fi

case $capacity in
    [0-1][0-9]|20)    echo " " ;;  # 0-20
    2[1-9]|3[0-9]|40) echo " " ;;  # 21-40
    4[1-9]|5[0-9]|60) echo " " ;;  # 41-60
    6[1-9]|7[0-9]|80) echo " " ;;  # 61-80
    *)                echo " " ;;  # 81-100
esac
