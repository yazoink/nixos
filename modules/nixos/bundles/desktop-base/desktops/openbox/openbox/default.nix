# relies on openbox home-manager module
{pkgs, ...}: {
  services.xserver.windowManager.openbox.enable = true;
  environment.systemPackages = with pkgs; [xinit libnotify];
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
}
