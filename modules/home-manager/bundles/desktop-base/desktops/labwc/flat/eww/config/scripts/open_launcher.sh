#!/usr/bin/env bash

eww -c . update control_center_visible=false
./launcher/scripts/get_apps.py update
./launcher/scripts/get_apps.py onchange ""

eww -c . active-windows | grep -q launcher
[ $? -ne 0 ] && eww -c . open launcher

eww -c . update show_launcher=true

