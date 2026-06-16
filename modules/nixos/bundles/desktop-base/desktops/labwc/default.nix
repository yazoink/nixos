{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) labwc labwc-glass;
in {
  config =
    lib.mkIf labwc.enable
    || labwc-glass.enable (lib.mkMerge [
      (import ./labwc {inherit pkgs;})
      (import ./hyprlock {})
    ]);
}
