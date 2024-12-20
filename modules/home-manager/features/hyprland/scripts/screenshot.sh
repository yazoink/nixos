#!/usr/bin/env bash

DIR="$HOME/pic/screenshots"
FILENAME="$DIR/$(date +%Y%m%d_%H:%M:%S_screenshot).png"

[ ! -d "$DIR" ] && mkdir -p "$DIR"

grim -g "$(slurp)" "$FILENAME" \
  && notify-send -i "$FILENAME" "Screenshot Saved" "$FILENAME"
