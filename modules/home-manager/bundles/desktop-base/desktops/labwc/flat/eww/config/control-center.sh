#!/usr/bin/env bash

./control_center/scripts/get_apps.py update
./control_center/scripts/get_apps.py onchange ""

eww -c . update control_center_visible=true
