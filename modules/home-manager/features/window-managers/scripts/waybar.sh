#!/usr/bin/env bash

bash "$EWW_CONFIG_DIR"/launch-corners.sh
pidof waybar && pkill waybar
echo "---" | tee -a /tmp/waybar.log
waybar 2>&1 | tee -a /tmp/waybar.log & disown
