# relies on openbox home-manager module
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xinit
    libnotify
    xorg-server
    xf86-input-evdev
    #xf86-input-mouse
    xf86-input-wacom
    xf86-input-synaptics
    xf86-video-intel
    xf86-video-ati
  ];
  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
    displayManager.startx.enable = true;
    layout = "us";
  };
  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
}
