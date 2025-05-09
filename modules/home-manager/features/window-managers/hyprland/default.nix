{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [./config ./hypridle.nix];
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
        settings = lib.mkMerge [
          (import ./config/autostart.nix {inherit osConfig;})
          (import ./config/animations.nix)
          (import ./config/env_vars.nix)
          (import ./config/general.nix {inherit config osConfig;})
          (import ./config/hardware.nix {inherit lib osConfig;})
          (import ./config/vars.nix {inherit config osConfig;})
        ];
      }
      (import ./config/plugins {
        inherit lib pkgs config osConfig inputs;
      })
    ];
  };
}
