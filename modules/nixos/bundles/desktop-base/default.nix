{config, lib, ...}:
{
  imports = [
    ../../features/file-managers
    ../../features/window-managers

    ../../features/acpi
    ../../features/audio
    ../../features/dconf
    ../../features/fonts
    ../../features/gnome-keyring
    ../../features/greetd
    ../../features/gtklock
    ../../features/plymouth
    ../../features/polkit
    ../../features/sddm
    ../../features/silent-boot
    ../../features/theme
  ];

  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    myOptions = {
      bundles.base.enable = true;
    };
    bundles.desktopBase = {
      acpi.enable = true;
      audio.enable = true;
      dconf.enable = true;
      fonts.enable = true;
      gnomeKeyring.enable = true;
      greetd.enable = false;
      gtklock.enable = true;
      hyprland.enable =  lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "hyprland")true;
      plymouth.enable = true;
      polkit.enable = true;
      sddm.enable = true;
      silentBoot.enable = true;
      sway.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "sway") true;
    };
  };
}
