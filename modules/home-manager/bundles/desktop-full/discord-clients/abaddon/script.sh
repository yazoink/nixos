CAT_CMD="$4"
TOKEN="$($CAT_CMD "$1")"
CONFIG_TEMPLATE_PATH="$2"
CONFIG_OUT_PATH="/home/$3/.config/abaddon/abaddon.ini"
CSS_FILE_PATH="$5"

original_config="$($CAT_CMD "$CONFIG_TEMPLATE_PATH")"
new_config="${original_config/TOKEN/$TOKEN}"
new_config="${new_config/CSS_FILE_PATH/$CSS_FILE_PATH}"
echo "$new_config" > "$CONFIG_OUT_PATH"
chmod 444 "$CONFIG_OUT_PATH"

