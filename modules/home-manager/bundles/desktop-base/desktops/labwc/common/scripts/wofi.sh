#!/usr/bin/env bash

pkill wofi

if [[ $? != 0 ]]; then
    eww open closer-window
    wofi --show drun
else
    eww close-all
fi
