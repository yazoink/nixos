{
  lib,
  osConfig,
  ...
}: {
  imports = [./config];
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
      {settings = import ./config/autostart.nix;}
      {settings = import ./config/animations.nix;}
    ];
  };
}
