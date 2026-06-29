{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig) myOptions;
  inherit (myOptions.bundles) art;
in
  lib.mkIf art.enable (lib.mkMerge [
    {
      hardwareFeatures.opentabletdriver.enable = true;
      home.packages = with pkgs; [
        inkscape
        krita
      ];
    }
    (import ./gimp {inherit osConfig config lib pkgs inputs;})
  ])
