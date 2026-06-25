# todo: menu, eww keybinds, keybind popup?
{
  osConfig,
  config,
  lib,
  pkgs,
  ...
}: let
in
  lib.mkMerge [
    (import ./themerc.nix {inherit config osConfig;})
    {
      wayland.windowManager.labwc = lib.mkMerge [
        (import ./config {inherit osConfig config lib;})
      ];
    }
  ]
