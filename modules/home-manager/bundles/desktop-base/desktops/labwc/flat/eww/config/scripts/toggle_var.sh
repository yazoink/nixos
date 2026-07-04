#!/usr/bin/env bash

state=$(eww get "$1")

if [ $state == true ]; then
    eww update "$1"=false
else
    sleep=false
    case "$1" in
        "music_visible")
            if [[ $(eww get monitor_visible) == true ]] || [[ $(eww get weather_visible) == true ]]; then
                sleep=true
            fi
            eww update monitor_visible=false
            eww update weather_visible=false
            ;;
        "monitor_visible")
            if [[ $(eww get music_visible) == true ]] || [[ $(eww get weather_visible) == true ]]; then
                sleep=true
            fi
            eww update music_visible=false
            eww update weather_visible=false
            sleep=true
            ;;
        "weather_visible")
            if [[ $(eww get monitor_visible) == true ]] || [[ $(eww get music_visible) == true ]]; then
                sleep=true
            fi
            eww update music_visible=false
            eww update monitor_visible=false
            eww poll weather_tz weather_temp weather_apparent_temp weather_icon weather_colour
            sleep=true
            ;;
        "lock_selected")
            eww update exit_selected=false
            eww update reboot_selected=false
            eww update shutdown_selected=false
            ;;
        "exit_selected")
            eww update lock_selected=false
            eww update reboot_selected=false
            eww update shutdown_selected=false
            ;;
        "reboot_selected")
            eww update lock_selected=false
            eww update exit_selected=false
            eww update shutdown_selected=false
            ;;
        "shutdown_selected")
            eww update lock_selected=false
            eww update exit_selected=false
            eww update reboot_selected=false
            ;;
    esac
    [ $sleep == true ] && sleep 0.6
    eww update "$1"=true
fi
