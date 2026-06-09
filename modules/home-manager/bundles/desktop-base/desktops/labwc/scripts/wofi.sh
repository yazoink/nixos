#!/usr/bin/env bash

pkill wofi

if [[ $? != 0 ]]; then
    eww --config ~/.config/widgets open closer-window
    wofi --show drun
else
    eww --config ~/.config/widgets close closer-window
fi

