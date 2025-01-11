TOKEN="$(cat "$1")"
CONFIG_TEMPLATE_PATH="$2"
CONFIG_OUT_PATH="/home/$3/.config/abaddon/abaddon.ini"

main() {
  [ ! -z "$CONFIG_OUT_PATH" ] && rm -rf "$CONFIG_OUT_PATH"
  original_config="$(cat "$CONFIG_TEMPLATE_PATH")"
  new_config="${original_config/TOKEN/$TOKEN}"
  echo "$new_config" > "$CONFIG_OUT_PATH"
}

main
