# relies on hyprland home-manager module
{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  options = {
    bundles.desktopBase.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprland.enable {
    bundles.desktopBase = {
      gtklock.enable = true;
    };
    services = {
      upower.enable = true; # for poweralertd
      dbus.enable = true;
      libinput.enable = true;
    };
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
