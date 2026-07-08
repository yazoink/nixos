#!/usr/bin/env bash

source "${YZSHELL_FUNCTIONS_DIR}/get/weather.sh"
source "${YZSHELL_FUNCTIONS_DIR}/get/cpu_perc.sh"

function get() {
    case "$1" in
        "dnd_icon")
            mode="$(makoctl mode)"
            if [[ "$mode" == *"do-not-disturb"* ]]; then
                echo ""
            else
                echo ""
            fi
            ;;
        "os_version")
            version="$(grep -E '^VERSION=' /etc/os-release | sed 's/VERSION=//;s/\"//g')"
            name="$(grep -E '^NAME=' /etc/os-release | sed 's/NAME=//')"
            echo "$name $version"
            ;;
        "music_artist")
            artist="$(mpc -f %artist% current)"
            if [[ -z "$artist" ]]; then
                echo "artist"
            else
                echo "$artist"
            fi
            ;;
        "music_song")
            song="$(mpc -f %title% current)"
            if [[ -z "$song" ]]; then
                echo "song"
            else
                echo "$song"
            fi
            ;;
        "music_status")
            if [[ "$(mpc status)" == *"[playing]"* ]]; then
                echo ""
            else
                echo ""
            fi
            ;;
        "music_cover")
            ensure_dirs "cache"
            cover="${YZSHELL_CACHE_DIR}/music_cover.jpg"
            ffmpeg -i "${MUSIC_DIR}/$(mpc current -f %file%)" "${cover}" -y &> /dev/null
            STATUS=$?

            # Check if the file has a embbeded album art
            if [ "$STATUS" -eq 0 ];then
                echo "$cover"
            else
                echo "images/music.png"
            fi
            ;;
        "cpu_temp") eval $TEMPS_CMD ;;
        "cpu_perc") get_cpu_perc ;;
        "weather_temp") get_weather "temp" ;;
        "weather_apparent_temp") get_weather "apparent_temp" ;;
        "weather_icon") get_weather "icon" ;;
        "weather_icon_colour") get_weather "icon_colour" ;;
        "weather_timezone") get_weather "timezone" ;;
        "bar_menu_icon")
            v="$(eww -c ${YZSHELL_EWW_DIR}/control_center get control_center_visible)"
            if [[ $v == true ]]; then
                echo ""
            else
                echo ""
            fi
            ;;
        "")
            echo "No argument specified."
            exit 1
            ;;
        *)
            echo "Cannot get '$1'."
            exit 1
            ;;
    esac
}
