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
