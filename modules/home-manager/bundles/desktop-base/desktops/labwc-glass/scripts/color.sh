#!/usr/bin/env bash

color="$(hyprpicker)"
[ "$color" != "" ] && wl-copy "$color" \
    && notify-send "$color" "Copied to clipboard."

