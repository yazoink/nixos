eww --config "$config" close power

if [[ $? != 0 ]]; then
    echo "opening power menu"
    eww --config "$config" open power
    if [[ $? == 0 ]]; then
        echo "power menu opened"
        hyprctl keyword bindn ,L,exec,hyprlock
        hyprctl keyword bindn ,R,exec,systemctl reboot
        hyprctl keyword bindn ,S,exec,systemctl shutdown
        hyprctl keyword bindn ,Escape,exec,bash ~/.config/widgets/launch-power-menu.sh
        echo "set keybinds"
        while true; do
            sleep 0.5
            eww --config "$config" active-windows | grep "power"
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
fi
