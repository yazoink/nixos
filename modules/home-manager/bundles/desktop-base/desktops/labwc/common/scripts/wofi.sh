#!/usr/bin/env bash

pkill wofi

if [[ $? != 0 ]]; then
    eww open closer-window
    wofi --show drun
fi

eww close-all
