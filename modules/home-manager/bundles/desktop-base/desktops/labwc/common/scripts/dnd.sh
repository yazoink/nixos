#!/usr/bin/env bash

mode="$(makoctl mode)"

if [[ "$mode" == *"do-not-disturb"* ]]; then
    makoctl mode -r do-not-disturb
    notify-send "Notifications" "Do not disturb disabled"
else
    makoctl mode -a do-not-disturb
fi
