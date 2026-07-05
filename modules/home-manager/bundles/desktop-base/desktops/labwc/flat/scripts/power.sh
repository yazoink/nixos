#!/usr/bin/env bash

v="$(eww get power_visible)"

if [ $v == true ]; then
    eww update power_visible=false
else
    eww update power_visible=true
fi
