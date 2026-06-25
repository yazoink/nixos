# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkMerge [
  (lib.mkIf osConfig.desktopTheme.stylix.enable
    (import ./stylix {inherit osConfig config lib pkgs inputs;}))
]
