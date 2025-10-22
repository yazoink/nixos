monitors=$(hyprctl monitors -j | jq length)
((monitors--))

eww --config "$config" kill
eww --config "$config" daemon

for monitor in $(seq 0 $monitors); do
    eww --config "$config" open fakecorners --screen $monitor
done
