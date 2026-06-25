{pkgs, ...}: let
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
in {
  home.packages = [colorScripts rcs];
}
