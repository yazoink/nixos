# relies on openbox home-manager module
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [xinit libnotify];
  services.xserver = {
    windowManager.openbox.enable = true;
    libinput.enable = true;
    layout = "us";
    xkbVariant = "";
  };
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
}
