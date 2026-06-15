# relies on openbox home-manager module
{pkgs, ...}: {
  services.xserver.windowManager.openbox.enable = true;
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
}
