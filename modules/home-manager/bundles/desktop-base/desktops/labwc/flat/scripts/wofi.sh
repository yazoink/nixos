#!/usr/bin/env bash

pkill wofi

if [[ $? != 0 ]]; then
    wofi --show run
fi
