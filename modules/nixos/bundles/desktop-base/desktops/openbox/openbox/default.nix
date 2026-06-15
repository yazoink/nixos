# relies on openbox home-manager module
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [xinit libnotify];
  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
    layout = "us";
  };
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
}
