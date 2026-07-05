#!/usr/bin/env bash

v="$(eww get control_panel_visible)"

if [ $v == true ]; then
    eww update control_panel_visible=false
else
    eww update control_panel_visible=true
fi

pkill -SIGRTMIN+9 waybar
