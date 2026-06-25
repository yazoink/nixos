# bare minimum desktop
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./desktops
    ./file-managers
    ./acpi
    ./audio
    ./dconf
    ./fonts
    ./gnome-keyring
    ./plymouth
    ./polkit
    ./silent-boot
    ./theme
  ];

  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    boot.loader.timeout = 0;
    myOptions = {
      bundles.base.enable = true;
    };
    bundles.desktopBase = {
      acpi.enable = true;
      audio.enable = true;
      dconf.enable = true;
      fonts.enable = true;
      gnomeKeyring.enable = true;
      polkit.enable = true;
    };
    environment.systemPackages = with pkgs; [
      libva-utils
      mesa-demos
    ];
  };
}
