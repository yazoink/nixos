#!/usr/bin/env bash

state=$(eww -c . get "$1")

if [ $state == true ]; then
    eww -c . update "$1"=false
else
    sleep=false
    case "$1" in
        "music_visible")
            if [[ $(eww -c . get monitor_visible) == true ]] || [[ $(eww -c . get weather_visible) == true ]]; then
                sleep=true
            fi
            eww -c . update monitor_visible=false
            eww -c . update weather_visible=false
            ;;
        "monitor_visible")
            if [[ $(eww -c . get music_visible) == true ]] || [[ $(eww -c . get weather_visible) == true ]]; then
                sleep=true
            fi
            eww -c . update music_visible=false
            eww -c . update weather_visible=false
            ;;
        "weather_visible")
            if [[ $(eww -c . get monitor_visible) == true ]] || [[ $(eww -c . get music_visible) == true ]]; then
                sleep=true
            fi
            eww -c . update music_visible=false
            eww -c . update monitor_visible=false
            eww -c . poll weather_tz weather_temp weather_apparent_temp weather_icon weather_colour
            ;;
        "lock_selected")
            eww -c . update exit_selected=false
            eww -c . update reboot_selected=false
            eww -c . update shutdown_selected=false
            ;;
        "exit_selected")
            eww -c . update lock_selected=false
            eww -c . update reboot_selected=false
            eww -c . update shutdown_selected=false
            ;;
        "reboot_selected")
            eww -c . update lock_selected=false
            eww -c . update exit_selected=false
            eww -c . update shutdown_selected=false
            ;;
        "shutdown_selected")
            eww -c . update lock_selected=false
            eww -c . update exit_selected=false
            eww -c . update reboot_selected=false
            ;;
    esac
    [ $sleep == true ] && sleep 0.6
    eww -c . update "$1"=true
fi
