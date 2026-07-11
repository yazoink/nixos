#!/usr/bin/env bash

source "${YZSHELL_FUNCTIONS_DIR}/cmd/screenshot.sh"

function cmd() {
    case "$1" in
            # confirms search selection -- opens app or closes launcher
        "search_confirm")
            # get currently selected app
            selected=$(eww -c "${YZSHELL_EWW_DIR}/control_center" get selected)
            if [ $selected -gt -1 ]; then
                # get launch command of selected app
                c="$(eww -c "${YZSHELL_EWW_DIR}/control_center" get search_results \
                    | jq -r ".[${selected}].cmd")"
                (cd "$HOME"; eval $c) & disown
            fi
            hide "control_center"
            ;;
        "music_next")
            mpc -q next
            get "music_cover"
            eww -c "${YZSHELL_EWW_DIR}/control_center" poll song song_artist song_status cover_art
            ;;
        "music_prev")
            mpc -q prev
            get "music_cover"
            eww -c "${YZSHELL_EWW_DIR}/control_center" poll song song_artist song_status cover_art
            ;;
        "music_toggle")
            mpc -q toggle
            eww -c "${YZSHELL_EWW_DIR}/control_center" poll song_status
            ;;
        "pick_colour")
            c="$(hyprpicker)"
            [ "$c" != "" ] && wl-copy "$c" \
                && notify-send "$c" "Copied to clipboard."
            ;;
        "screenshot_full") screenshot "full" "$2" ;;
        "screenshot_select") screenshot "select" "$2" ;;
        "")
            echo "No argument specified."
            exit 1
            ;;
        *)
            echo "Command '$1' does not exist."
            exit 1
            ;;
    esac
}
