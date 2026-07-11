#!/usr/bin/env bash

function configure() {
    if [ ! -f "$YZSHELL_COLOURSCHEME_CACHE_FILE" ]; then
        echo "camellia" > "$YZSHELL_COLOURSCHEME_CACHE_FILE"
    fi
    export COLOURSCHEME=$(cat $YZSHELL_COLOURSCHEME_CACHE_FILE)
    case "$1" in
        "waybar")
            ensure_dirs "waybar"
            cp -r --no-preserve=mode,ownership "${YZSHELL_BASE_CONFIG_DIR}/waybar/"* "$YZSHELL_WAYBAR_DIR"
            "$YZSHELL_FUNCTIONS_DIR"/configure/waybar.py
            "$YZSHELL_FUNCTIONS_DIR"/configure/colours.py "waybar"
            ;;
        "eww")
            ensure_dirs "eww"
            cp -r --no-preserve=mode,ownership "${YZSHELL_BASE_CONFIG_DIR}/eww/"* "$YZSHELL_EWW_DIR"
            "$YZSHELL_FUNCTIONS_DIR"/configure/colours.py "eww"
            ;;
        "mako")
            ensure_dirs "mako"
            echo "include=${YZSHELL_MAKO_COLOURS_FILE}" > "$YZSHELL_MAKO_CONF_FILE"
            cat "${YZSHELL_BASE_CONFIG_DIR}/mako/config" >> "$YZSHELL_MAKO_CONF_FILE"
            "$YZSHELL_FUNCTIONS_DIR"/configure/colours.py "mako"
            ;;
        "")
            configure "waybar"
            configure "eww"
            configure "mako"
            ;;
    esac
}
