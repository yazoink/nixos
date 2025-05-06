#!/usr/bin/env bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
echo "$battery%"
