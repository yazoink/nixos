$monitor=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')
eww --config "$config" open confirm --arg screen=$monitor --arg thing="$1" --arg action="$2"

if [[ $? == 0 ]]; then
    echo "confirm prompt opened"
    hyprctl keyword bindn ,Y,exec,"$2"
    hyprctl keyword bindn ,N,exec,eww --config "$config" close confirm
    hyprctl keyword bindn ,Escape,exec,eww --config "$config" close confirm
    echo "set keybinds"
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep "confirm"
        if [[ $? != 0 ]]; then
            hyprctl reload
            echo "hyprland reloaded"
            exit 0
        fi
    done
else
    echo "error: eww failed to launch"
    exit 1
fi
