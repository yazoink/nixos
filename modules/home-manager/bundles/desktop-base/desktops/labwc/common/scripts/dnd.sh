#!/usr/bin/env bash

mode="$(makoctl mode)"

if [[ "$mode" == *"do-not-disturb"* ]]; then
    mode -r do-not-disturb
    notify-send "Notifications" "Do not disturb disabled"
else
    mode -a do-not-disturb
fi
