#!/usr/bin/env bash
ls_output="$(ls "$2")"
images=($ls_output)

for image in "${images[@]}"; do
  $1 "$2/$image" "#A87569" "$3" "/home/$4/.config/simple-logout/icons/$image"
done
