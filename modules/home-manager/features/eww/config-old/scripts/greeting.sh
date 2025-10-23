#!/usr/bin/env bash

name="$(whoami)"
name="${name^}"

hour=$(date +%H)

greeting="Good "

if [ $hour -lt 12 ]; then
    greeting+="morning"
else
    if [ $hour -lt 17 ]; then
        greeting+="afternoon"
    else
        if [ $hour -lt 21 ]; then
            greeting+="evening"
        else
            greeting+="night"
        fi
    fi
fi

greeting+=", $name :)"

echo "$greeting"
