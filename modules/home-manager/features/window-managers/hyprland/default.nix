{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [./hypridle.nix];
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    stylix.targets.hyprland.enable = false;
    bundles.desktopBase = {
      mako.enable = true;
      wofi.enable = true;
      ironbar.enable = true;
      screenshot.enable = true;
      hyprViewBinds.enable = true;
      swayosd.enable = true;
    };
    wayland.windowManager.hyprland = lib.mkMerge [
      {
        enable = true;
        package = null;
        portalPackage = null;
      }
      (import ./config {
        inherit lib osConfig config pkgs inputs;
      })
    ];
  };
}
