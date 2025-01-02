{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    services = {
      upower.enable = true;
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
