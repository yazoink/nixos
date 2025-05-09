#!/usr/bin/env sh

max=$(brightnessctl max)
current=$(brightnessctl get)
percentage=$(( 100 * current / max ))

if [ $percentage -gt 50 ]; then
    echo ""
else
    echo ""
fi
