#!/usr/bin/env bash

function screenshot() {
    hide "screenshot"
    file="$SCREENSHOT_DIR/$(date +%Y%m%d_%H:%M:%S_screenshot).png"
    [ ! -z "$2" ] && file="$2" && echo "??"
    echo "$file"

    ensure_dirs "screenshot"

    [ "$3" == "sleep" ] && sleep 0.5

    case "$1" in
        "full") grim "$file" ;;
        "select") grim -g "$(slurp)" "$file" ;;
    esac

    notify-send -i "$file" "Screenshot saved" "$file"
}
