#!/usr/bin/env bash

PASSWORD=""

if [ "$1" == "$PASSWORD" ]; then
    eww update lock_visible=false
    eww close lock
    if [ $(cat "/tmp/lock_dnd") == true ]; then
        makoctl mode -r do-not-disturb
    fi
else
    eww update password=""
fi
