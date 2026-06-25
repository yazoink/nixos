{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) labwc-flat labwc-glass;
in {
  config = lib.mkIf (labwc-flat.enable
    || labwc-glass.enable) (lib.mkMerge [
    (import ./labwc {inherit pkgs;})
    (import ./hyprlock {})
  ]);
}
