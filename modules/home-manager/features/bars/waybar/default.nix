{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  inherit (osConfig.myOptions.hardwareFeatures.laptop) batteryName;
  barHeight = 36;
  barPosition = "top";
  workspaceModule = ''
    "hyprland/workspaces": {
      "on-click": "activate",
      "format": "{icon}"
    },
  '';
in {}
