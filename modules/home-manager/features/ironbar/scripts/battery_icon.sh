#!/usr/bin/env bash

# Get battery status and capacity in one go to minimize file reads
status_file="/sys/class/power_supply/$1/status"
capacity_file="/sys/class/power_supply/$1/capacity"

# Read both values efficiently
read -r status < "$status_file"
read -r battery < "$capacity_file"

# If charging, print the icon and exit
if [[ $status == "Charging" ]]; then
    echo ""
    exit 0
fi

# Determine battery icon based on capacity
case $battery in
    [0-1][0-9]|20)   icon="" ;;  # 0-20
    2[1-9]|3[0-9]|40) icon="" ;; # 21-40
    4[1-9]|5[0-9]|60) icon="" ;; # 41-60
    6[1-9]|7[0-9]|80) icon="" ;; # 61-80
    *)                icon="" ;; # 81-100+
esac

echo "$icon"
