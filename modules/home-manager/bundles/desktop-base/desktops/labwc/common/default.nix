# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc-flat labwc-glass;
in {
  config = lib.mkIf (labwc-flat.enable || labwc-glass.enable) (lib.mkMerge [
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./swayidle {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
    (import ./kanshi {inherit config osConfig lib pkgs;})
  ]);
}
