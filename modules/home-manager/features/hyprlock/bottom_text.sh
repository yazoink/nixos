#!/usr/bin/env bash

function main() {
    bat_percentage=$(get_bat_percentage)
    if [[ $? == 0 ]]; then
        bat_icon="$(get_bat_icon $bat_percentage)"
        echo "<span font_family='Font Awesome 6 Free'>$bat_icon</span> $bat_percentage%"
    else
        song="$(get_song)"
        echo "<span font_family='Font Awesome 6 Free'> </span> $song"
    fi
}

function get_bat_percentage() {
    files=(
        "/sys/class/power_supply/BAT0/capacity"
        "/sys/class/power_supply/BAT1/capacity"
    )

    for file in "${files[@]}"; do
        [ -f "$file" ] && {
            echo $(cat "$file")
            return 0
        }
    done
    return 1
}

function get_bat_icon() {
    bat_percentage=$1
    icons=(
        [16]=" "
        [32]=" "
        [48]=" "
        [64]=" "
        [80]=" "
    )
    for icon in "${!icons[@]}"; do
        [[ $bat_percentage < $icon ]] && {
            echo "${icons[$icon]}"
            return 0
        }
    done
}

function get_song () {
    song="$(mpc current)"
    [ "$song" == "" ] && {
        echo "nothing playing..."
        return 0
    }
    echo "$song"
}

main
