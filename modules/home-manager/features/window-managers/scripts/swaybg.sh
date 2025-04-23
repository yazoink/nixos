#!/usr/bin/env bash

WALLPAPER="$2"
NOTIFY=true

if [ $# == 3 ] && [ "$3" == "-q" ]; then
    NOTIFY=false
fi

case "$1" in
    "-i" | "--image")
        pkill swaybg
        swaybg -i "$WALLPAPER" -m fill &
        disown ;;
    "-t" | "--tiling-image")
        pkill swaybg
        swaybg -i "$WALLPAPER" -m tile &
        disown ;;
    "-c" | "--color")
        pkill swaybg
        swaybg -c "$WALLPAPER" &
        disown ;;
    *)
        echo "Error: invalid argument"
        exit 1 ;;
esac

[ $NOTIFY == true ] \
    && notify-send "Wallpaper" "Reset wallpaper" -i "$WALLPAPER"
