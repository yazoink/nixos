#!/usr/bin/env bash

pkill wofi

if [[ $? != 0 ]]; then
    eww --config "$EWW_CONFIG_DIR" open closer-window
    wofi --show drun
else
    eww --config "$EWW_CONFIG_DIR" close closer-window
fi
