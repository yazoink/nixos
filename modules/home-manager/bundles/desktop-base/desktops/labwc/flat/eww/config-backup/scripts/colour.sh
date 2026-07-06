#!/usr/bin/env bash

# val=$(eww -c . get "$1")
val=$1

if [[ $val -le 30 || $1 == "null" ]]; then
    echo "base0D"
elif [[ $val -le 60 ]]; then
    echo "base0B"
elif [[ $val -le 80 ]]; then
    echo "base0A"
else
    echo "base09"
fi

