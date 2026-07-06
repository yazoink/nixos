#!/usr/bin/env bash

JSON_FILE="/tmp/weather.json"

function update_json() {
    err=$(curl -s -w "%{http_code}" -o "/tmp/weather.json" "https://api.open-meteo.com/v1/forecast?latitude=-37.814&longitude=144.9633&hourly=temperature_2m&current=temperature_2m,precipitation,cloud_cover,apparent_temperature,wind_speed_10m,is_day&timezone=auto&forecast_days=3")
    if [ $err == 200 ]; then
        echo true
    else
        echo false
    fi
    exit 0
}

if [ ! -f "$JSON_FILE" ]; then
    case "$1" in
        "-i" | "--icon") echo "" ;;
        "-u" | "--update") update_json ;;
        *) echo "n/a" ;;
    esac
    exit 0
fi

json=$(cat "$JSON_FILE")

case "$1" in
    "-u" | "--update") update_json; echo "true" ;;
    "-t" | "--temperature")
        temp=$(echo "$json" | jq ".current.temperature_2m")
        unit=$(echo "$json" | jq ".current_units.temperature_2m" | sed 's/"//g')
        echo "$temp$unit"
        ;;
    "-at" | "--apparent-temperature")
        temp=$(echo "$json" | jq ".current.apparent_temperature")
        unit=$(echo "$json" | jq ".current_units.apparent_temperature" | sed 's/"//g')
        echo "Feels like $temp$unit"
        ;;
    "-i" | "--icon")
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
    "-c" | "--colour")
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
    "-tz" | "--timezone")
        tz=$(echo $json | jq ".timezone" | sed 's/"//g')
        abv=$(echo $json | jq ".timezone_abbreviation" | sed 's/"//g')
        echo "$tz ($abv)"
        ;;
esac
