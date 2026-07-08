#!/usr/bin/env bash

function get_weather() {
    if [ ! -f "$YZSHELL_WEATHER_CACHE_FILE" ]; then
        ensure_dirs "cache"
        if [ "$1" == "icon" ]; then
            echo ""
        elif [ "$1" == "icon_colour" ]; then
            echo "base0D"
        else
            echo "N/A"
        fi
        exit 0
    fi
    json=$(cat "$YZSHELL_WEATHER_CACHE_FILE")

    case "$1" in
        "temp")
            temp=$(echo "$json" | jq ".current.temperature_2m")
            unit=$(echo "$json" | jq ".current_units.temperature_2m" | sed 's/"//g')
            echo "$temp$unit"
            ;;
        "apparent_temp")
            temp=$(echo "$json" | jq ".current.apparent_temperature")
            unit=$(echo "$json" | jq ".current_units.apparent_temperature" | sed 's/"//g')
            echo "Feels like ${temp}${unit}"
            ;;
        "icon")
            rain=$(echo "$json" | jq ".current.precipitation")
            cloud=$(echo "$json" | jq ".current.cloud_cover")
            is_day=$(echo "$json" | jq ".current.is_day")

            if (( $(bc <<< "$rain > 0.1") )); then # rain
                if [ $is_day -eq 1 ]; then # day
                    echo ""
                else # night
                    echo ""
                fi
            else # no rain
                if (( $(bc <<< "$cloud > 50") )); then # cloud
                    if [ $is_day -eq 1 ]; then # day
                        echo ""
                    else # night
                        echo ""
                    fi
                else # no cloud
                    if [ $is_day -eq 1 ]; then # day
                        echo ""
                    else # night
                        echo ""
                    fi
                fi
            fi
            ;;
        "icon_colour")
            rain=$(echo "$json" | jq ".current.precipitation")
            cloud=$(echo "$json" | jq ".current.cloud_cover")
            is_day=$(echo "$json" | jq ".current.is_day")

            if (( $(bc <<< "$rain > 0.1") )); then # rain
                echo "base0D"
            else # no rain
                if [ $is_day -eq 1 ]; then # day
                    echo "base0A"
                else # night
                    echo "base0D"
                fi
            fi
            ;;
        "timezone")
            tz=$(echo $json | jq ".timezone" | sed 's/"//g')
            abv=$(echo $json | jq ".timezone_abbreviation" | sed 's/"//g')
            echo "$tz ($abv)"
            ;;
    esac
}
