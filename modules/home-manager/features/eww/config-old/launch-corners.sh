monitors=$(hyprctl monitors -j | jq length)
((monitors--))

pkill eww

for monitor in $(seq 0 $monitors); do
    eww --config "$config" open fakecorners --screen $monitor --id corners-$monitor
done
