#!/usr/bin/env bash

pidof waybar && pkill waybar
echo "---" | tee -a /tmp/waybar.log
waybar 2>&1 | tee -a /tmp/waybar.log & disown
