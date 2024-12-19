{pkgs, config, lib, ...}:
let
  colorScripts = pkgs.callPackage ./color-scripts.nix {};
  dollarSign = "$";
  rcs = pkgs.writeShellScriptBin "rcs" ''
    #!/usr/bin/env bash

    ls_output="$(ls ${colorScripts})"
    IFS=" " read -ra scripts <<< "$ls_output"
    index=$(echo $((1 + $RANDOM % ${dollarSign}{#scripts[@]})))
    ${colorScripts}/$scripts[$index]
  '';
in
{
  options = {
    bundles.desktopFull.colorScripts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.colorScripts.enable {
    home.packages = [colorScripts rcs];
  };
}
