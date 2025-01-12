#!/usr/bin/env bash

WALLPAPER="$1"
NOTIFY=true

if [ $# == 2 ] && [ "$2" == "-q" ]; then
  NOTIFY=false
fi

pkill swaybg
swaybg -i "$WALLPAPER" -m fill &
disown

[ $NOTIFY == true ] \
  && notify-send "Wallpaper" "Reset wallpaper" -i "$WALLPAPER"
