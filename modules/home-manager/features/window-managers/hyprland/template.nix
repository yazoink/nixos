{
  pkgs,
  config,
  lib,
  osConfig,
  inputs,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {};
  };
}
