{writeShellScriptBin}: let
  dollarSign = "$";
in
  writeShellScriptBin "screenshot" ''
    #!/usr/bin/env bash

    DIR="${dollarSign}HOME/pic/screenshots"
    FILENAME="${dollarSign}DIR/${dollarSign}(date +%Y%m%d_%H:%M:%S_screenshot).png"

    [ ! -d "${dollarSign}DIR" ] && mkdir -p "${dollarSign}DIR"

    function main() {
      case "${dollarSign}1" in
        "-h" | "--help") help && exit 0;;
        "-f" | "--fullscreen" | "") grim "${dollarSign}FILENAME";;
        "-s" | "--select") grim -g "${dollarSign}(slurp)" "$FILENAME";;
        *) echo "Error: argument not recognised" && exit 1;;
      esac
      [ ${dollarSign}? == 0 ] && notify-send -i "${dollarSign}FILENAME" "Screenshot Saved" "${dollarSign}FILENAME"
    }

    function help() {
      echo "usage: screenshot [option]"
      echo "options:"
      echo "    -f | --fullscreen) take a fullscreen screenshot"
      echo "    -s | --select) take a selective screenshot"
    }

    main "${dollarSign}@"
  ''
