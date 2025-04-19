#!/usr/bin/env bash

pidof wofi
ret=$?

if [[ $ret == 0 ]]; then
    pkill wofi
else
    wofi --show drun
fi
