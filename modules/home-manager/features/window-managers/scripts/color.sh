#!/usr/bin/env bash

color="$(hyprpicker)"
[ $? == 0 ] && wl-copy "$color" \
    && notify-send "$color" "Copied to clipboard."

