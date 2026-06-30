#!/usr/bin/env bash

eww reload

if [[ $? == 0 ]]; then
    notify-send "Eww" "Configuration reloaded"
else
    notify-send "Eww" "Reload failed!"
fi
