#!/usr/bin/env bash

WALLPAPER="$1"
pkill swaybg
swaybg -i "$WALLPAPER" -m fill &
disown
