pkill walker

monitors=$(hyprctl monitors -j | jq length)
((monitors--))

monitor=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')

windows="$(eww --config $config active-windows)"
for monitor in $(seq 0 $monitors); do
    echo "$windows" | grep "power-$monitor"
    if [[ $? == 0 ]]; then
        eww --config "$config" close power-$monitor
        echo "closed window"
        exit 0
    fi
done

echo "opening power menu"
eww --config "$config" open power --screen $monitor --id power-$monitor
if [[ $? == 0 ]]; then
    echo "power menu opened"
    hyprctl keyword bindn ,L,exec,hyprlock
    hyprctl keyword bindn ,R,exec,systemctl reboot
    hyprctl keyword bindn ,S,exec,systemctl shutdown
    hyprctl keyword bindn ,E,exec,hyprctl dispatch exit
    hyprctl keyword bindn ,Escape,exec,bash ~/.config/widgets/launch-power-menu.sh
    echo "set keybinds"
    while true; do
        sleep 0.5
        eww --config "$config" active-windows | grep -q "power"
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
