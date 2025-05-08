#!/usr/bin/env bash

output=$(amixer get Master)
if [[ $output == *"[off]"* ]]; then
    echo ""
    exit 0
fi
volume="${output#*[\[}"
volume="${volume%%\%]*}"
if (( volume > 50 )); then
    echo ""
elif (( volume > 25 )); then
    echo ""
else
    echo ""
fi
