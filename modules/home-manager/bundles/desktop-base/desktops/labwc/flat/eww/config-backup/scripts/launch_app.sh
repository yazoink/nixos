#!/usr/bin/env bash

eww update control_panel_visible=false
pkill -SIGRTMIN+9 waybar
$1 & disown
