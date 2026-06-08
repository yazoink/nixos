# relies on labwc home-manager module
{pkgs, ...}: {
  programs.labwc.enable = true;
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [
        "wlr"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = ["wlr" "gtk"];
    };
  };
}
