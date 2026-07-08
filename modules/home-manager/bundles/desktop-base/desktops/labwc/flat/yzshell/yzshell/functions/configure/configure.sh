#!/usr/bin/env bash

function configure() {
    case "$1" in
        "waybar")
            ensure_dirs "waybar"
            cp -r --no-preserve=mode,ownership "${YZSHELL_BASE_CONFIG_DIR}/waybar/"* "$YZSHELL_WAYBAR_DIR"
            "$YZSHELL_FUNCTIONS_DIR"/configure/waybar.py
            ;;
        "eww")
            ensure_dirs "eww"
            cp -r --no-preserve=mode,ownership "${YZSHELL_BASE_CONFIG_DIR}/eww/"* "$YZSHELL_EWW_DIR"
            ;;
        "mako")
            ensure_dirs "mako"
            echo "include=${YZSHELL_MAKO_COLOURS_FILE}" > "$YZSHELL_MAKO_CONF_FILE"
            cat "${YZSHELL_BASE_CONFIG_DIR}/mako/config" >> "$YZSHELL_MAKO_CONF_FILE"
            ;;
        "")
            configure "waybar"
            configure "eww"
            configure "mako"
            ;;
    esac
    scheme="$COLOURSCHEME"
    [ ! -z "$2" ] && scheme="$2"
    "$YZSHELL_FUNCTIONS_DIR"/configure/colours.py "$scheme"
}
