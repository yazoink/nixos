#!/usr/bin/env bash

labwc -r

if [[ $? == 0 ]]; then
    notify-send "Labwc" "Configuration reloaded"
else
    notify-send "Labwc" "Reload failed!"
fi
