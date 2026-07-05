{writeShellScriptBin}: let
  dollarSign = "$";
in
  writeShellScriptBin "dnd" ''
    #!/usr/bin/env bash

    mode="${dollarSign}(makoctl mode)"

    if [[ "${dollarSign}mode" == *"do-not-disturb"* ]]; then
        makoctl mode -r do-not-disturb
        notify-send "Notifications" "Do not disturb disabled"
    else
        makoctl mode -a do-not-disturb
    fi

    # pkill -RTMIN+8 waybar
    eww poll dnd_icon
  ''
