{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) labwc;
in {
  config = lib.mkIf labwc.enable (lib.mkMerge [
    (import ./labwc {inherit pkgs;})
    (import ./hyprlock {})
  ]);
}
