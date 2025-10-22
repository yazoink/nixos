monitors=$(hyprctl monitors -j | jq length)
((monitors--))

eww kill

for monitor in $(seq 0 $monitors); do
    eww --config "$config" open fakecorners --screen $monitor --id $monitor
done
