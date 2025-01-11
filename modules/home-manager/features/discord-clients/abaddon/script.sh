CAT_CMD="$4"
TOKEN="$($CAT_CMD "$1")"
CONFIG_TEMPLATE_PATH="$2"
CONFIG_OUT_PATH="/home/$3/.config/abaddon/abaddon.ini"
echo $1
echo $2
echo $3
echo $4

original_config="$($CAT_CMD "$CONFIG_TEMPLATE_PATH")"
new_config="${original_config/TOKEN/$TOKEN}"
echo "$new_config" > "$CONFIG_OUT_PATH"

