#!/usr/bin/env bash

out="$(makoctl mode | grep do-not-disturb)"
ret=$?

if [[ $ret == 0 ]]; then
    echo " "
else
    echo " "
fi
