{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.base = true;
      wrapperFeatures.gtk = true;
    };
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
