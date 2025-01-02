{config, lib, pkgs, ...}:
{
  options = {
    bundles.desktopBase.sway.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.sway.enable {
    bundles.desktopBase = {
      gtklock.enable = true;
    };
    security.pam.loginLimits = [
      { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
    ];
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.base = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
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
