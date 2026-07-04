{writeShellScriptBin}: let
  dollarSign = "$";
in
  writeShellScriptBin "color" ''
    #!/usr/bin/env bash

    color="${dollarSign}(hyprpicker)"
    [ "${dollarSign}color" != "" ] && wl-copy "${dollarSign}color" \
        && notify-send "${dollarSign}color" "Copied to clipboard."

  ''
