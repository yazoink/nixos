#!/usr/bin/env bash

echo "$1"

# eww -c . update control_center_visible=false
# eww -c . close control_center
eww -c . update selected=-1
eww -c . update user_input=""

(cd "$HOME"; exec $1) & disown
