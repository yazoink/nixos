#!/usr/bin/env bash

output=$(amixer get Master)
if [[ $output == *"[off]"* ]]; then
    echo ""
    exit 0
fi
volume=$(echo "$output" | awk -F"[][]" '/Left:/ { print $2 }' | tr -d '%')
if (( volume > 50 )); then
    echo ""
elif (( volume > 25 )); then
    echo ""
else
    echo ""
fi
