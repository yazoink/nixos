{pkgs, config, lib, ...}:
let
  colorScripts = pkgs.callPackage ./color-scripts.nix {};
  dollarSign = "$";
  rcs = pkgs.writeShellScriptBin "rcs" ''
    #!/usr/bin/env bash
    clear
    ls_output="$(ls ${colorScripts}/bin)"
    scripts=($ls_output)
    index=$((RANDOM % ${dollarSign}{#scripts[@]}))
    ${colorScripts}/bin/${dollarSign}{scripts[$index]}
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
