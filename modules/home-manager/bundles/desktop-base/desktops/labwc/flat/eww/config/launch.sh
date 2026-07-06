#!/usr/bin/env bash

pkill eww
eww -c . daemon

./control_center/scripts/get_apps.py update
./control_center/scripts/get_apps.py onchange ""

eww -c . open control_center
eww -c . open calendar
eww -c . open power
