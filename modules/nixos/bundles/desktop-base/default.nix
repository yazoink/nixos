{
  config,
  lib,
  ...
}: {
  imports = [
    ../../features/file-managers
    ../../features/window-managers
    ../../features/display-managers
    ../../features/lockscreens

    ../../features/acpi
    ../../features/audio
    ../../features/dconf
    ../../features/fonts
    ../../features/gnome-keyring
    ../../features/plymouth
    ../../features/polkit
    ../../features/silent-boot
    ../../features/theme
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
      hyprland.enable = true;
      polkit.enable = true;
    };
  };
}
