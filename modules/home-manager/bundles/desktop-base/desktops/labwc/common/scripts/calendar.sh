#!/usr/bin/env bash

v="$(eww get calendar_visible)"

if [ $v == true ]; then
    eww update calendar_visible=false
else
    eww update calendar_visible=true
fi
