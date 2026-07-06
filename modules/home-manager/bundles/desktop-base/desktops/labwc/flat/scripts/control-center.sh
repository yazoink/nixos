#!/usr/bin/env bash

v="$(eww get control_center_visible)"

if [ $v == true ]; then
    eww update control_center_visible=false
else
    eww update control_center_visible=true
fi

pkill -SIGRTMIN+9 waybar
