#!/usr/bin/env bash

color="$(hyprpicker)"
wl-copy "$color" \
  && notify-send "$color" "Copied to clipboard." 
