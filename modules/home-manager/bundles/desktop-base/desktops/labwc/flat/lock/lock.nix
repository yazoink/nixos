{writeShellScriptBin}: let
  dollarSign = "$";
in
  writeShellScriptBin "lock" ''
    #!/usr/bin/env bash
    playerctl pause &
    eww update lock_visible=true &
    eww open lock &

    mode="${dollarSign}(makoctl mode)"
    if [[ "${dollarSign}mode" != *"do-not-disturb"* ]]; then
        makoctl mode -a do-not-disturb
        echo true > "/tmp/lock_dnd"
    else
        echo false > "/tmp/lock_dnd"
    fi
  ''
