#!/usr/bin/env sh

output=$(amixer get Master)
if echo "$output" | grep -q '\[off\]'; then
    echo ""
    exit 0
fi
volume=$(echo "$output" | awk -F"[][]" '/Left:/ { print $2 }' | tr -d '%')
if [ $volume -gt 50 ]; then
    echo ""
elif [ $volume -gt 25 ]; then
    echo ""
else
    echo ""
fi
