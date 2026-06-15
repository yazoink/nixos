#!/usr/bin/env bash

out="$(makoctl mode | grep do-not-disturb)"
ret=$?

if [[ $ret == 0 ]]; then
    out="$(makoctl mode -r do-not-disturb)"
    notify-send "Notifications" "Do-not-disturb disabled"
else
    out="$(makoctl mode -a do-not-disturb)"
fi
