#!/usr/bin/env bash

function screenshot() {
    file="$SCREENSHOT_DIR/$(date +%Y%m%d_%H:%M:%S_screenshot).png"

    ensure_dirs "screenshot"

    case "$1" in
        "full") grim "$file" ;;
        "select") grim -g "$(slurp)" "$file" ;;
    esac
}
