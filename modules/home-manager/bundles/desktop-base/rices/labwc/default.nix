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
    # common
    lib.mkMerge [
      (import ./common {inherit osConfig config lib pkgs inputs;})
    ]
    # flat
    (lib.mkIf
      labwc-flat.enable
      (import ./labwc-flat {inherit osConfig config lib pkgs inputs;}))
    # glass
    (lib.mkIf
      labwc-glass.enable
      (import ./labwc-glass {inherit osConfig config lib pkgs inputs;}))
  )
