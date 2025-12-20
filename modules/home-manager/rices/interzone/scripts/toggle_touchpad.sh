#!/usr/bin/env bash

# disable/enable touchpad while typing

hyprctl getoption input:touchpad:disable_while_typing | grep 'int: 1'

case $? in
    0)
        hyprctl keyword input:touchpad:disable_while_typing false
        notify-send "Disable Touchpad While Typing" "Disabled"
        ;;
    *)
        hyprctl keyword input:touchpad:disable_while_typing true
        notify-send "Disable Touchpad While Typing" "Enabled"
        ;;
esac
