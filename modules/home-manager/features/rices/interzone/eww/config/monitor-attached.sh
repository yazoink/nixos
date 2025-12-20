#!/usr/bin/env bash

config="$EWW_CONFIG_DIR"
eww --config "$config" open fakecorners --screen $1 --id $1
pkill waybar; waybar
