#!/usr/bin/env bash

pkill eww
eww daemon

"$HOME"/.config/eww/control_center/scripts/get_apps.py update
"$HOME"/.config/eww/control_center/scripts/get_apps.py onchange ""

eww open control_center
eww open calendar
eww open power

if [ "$1" == "notify" ]; then
    notify-send "Eww" "Configuration reloaded"
fi
