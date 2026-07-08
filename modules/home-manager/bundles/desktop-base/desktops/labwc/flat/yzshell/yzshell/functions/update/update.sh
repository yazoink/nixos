#!/usr/bin/env bash

source "${YZSHELL_FUNCTIONS_DIR}/update/search.sh"

function update() {
    case "$1" in
         # updates the json file storing app list
        "search_cache") update_search_cache "$YZSHELL_APP_SEARCH_CACHE_FILE" "$TERM" ;;
        # refreshes the search results, takes search string as optional arg
        "search_results")
            selected=-1

            # if json file doesn't exist, make it
            [[ ! -f "$YZSHELL_APP_SEARCH_CACHE_FILE" ]] && update "search_cache"

            # get search string
            search_str="$2"
            if [[ "$search_str" != "" ]]; then
                selected=0
            fi

            json="$(update_search_results "$YZSHELL_APP_SEARCH_CACHE_FILE" "$search_str")"
            eww -c "${YZSHELL_EWW_DIR}/control_center" update selected=$selected
            eww -c "${YZSHELL_EWW_DIR}/control_center" update search_results="$json"
            ;;
        "dnd")
            mode="$(makoctl mode)"
            if [[ "$mode" == *"do-not-disturb"* ]]; then
                makoctl mode -r do-not-disturb
                notify-send "Notifications" "Do not disturb disabled"
            else
                makoctl mode -a do-not-disturb
            fi
            eww -c "${YZSHELL_EWW_DIR}/control_center" poll dnd_icon
            ;;
        "weather_cache")
            err=$(curl -s -w "%{http_code}" -o "$YZSHELL_WEATHER_CACHE_FILE" "https://api.open-meteo.com/v1/forecast?latitude=-37.814&longitude=144.9633&hourly=temperature_2m&current=temperature_2m,precipitation,cloud_cover,apparent_temperature,wind_speed_10m,is_day&timezone=auto&forecast_days=3")
            if [ $err == 200 ]; then
                echo true
            else
                echo false
            fi
            ;;
        "")
            echo "No argument specified."
            exit 1
            ;;
        *)
            echo "Cannot update '$1'."
            exit 1
            ;;
    esac
}