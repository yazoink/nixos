# labwc configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc-flat labwc-glass;
in
  lib.mkIf (labwc-flat.enable || labwc-glass.enable) (
    lib.mkMerge [
      # common
      (import ./common {inherit osConfig config lib pkgs inputs;})
      # flat
      (lib.mkIf
        labwc-flat.enable
        (import ./flat {inherit osConfig config lib pkgs inputs;}))
      # glass
      (lib.mkIf
        labwc-glass.enable
        (import ./glass {inherit osConfig config lib pkgs inputs;}))
    ]
  )
