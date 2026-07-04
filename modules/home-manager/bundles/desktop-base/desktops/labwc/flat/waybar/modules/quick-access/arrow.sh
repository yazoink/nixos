#!/usr/bin/env bash

FILE="/tmp/waybar_arrow"
[ ! -f "$FILE" ] && echo "left" > "$FILE"

a=$(cat $FILE)

if [[ $a == 0 ]]; then
    echo 1 > "$FILE"
    echo ""
else
    echo 0 > "$FILE"
    echo ""
fi

