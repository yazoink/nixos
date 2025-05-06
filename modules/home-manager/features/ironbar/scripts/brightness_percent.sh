#!/usr/bin/env bash

max=$(brightnessctl max)
current=$(brightnessctl get)
percentage=$(( 100 * current / max ))
echo "$percentage%"
