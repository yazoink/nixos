monitors=$(hyprctl monitors -j | jq length)
((monitors--))

eww --config "$config" open fakecorners --screen $1 --id $1
