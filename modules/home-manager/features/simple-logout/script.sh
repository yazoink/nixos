#!/usr/bin/env bash
output_dir="/home/$4/.config/simple-logout/icons"

[ -d "$output_dir" ] && /run/current-system/sw/bin/rm -rf "$output_dir"
/run/current-system/sw/bin/mkdir -p "$output_dir"

ls_output="$(/run/current-system/sw/bin/ls "$2")"
images=($ls_output)

for image in "${images[@]}"; do
  $1 "$2/$image" "#A87569" "$3" "$output_dir/$image"
done
