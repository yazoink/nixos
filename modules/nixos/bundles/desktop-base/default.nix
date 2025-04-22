{
  config,
  lib,
  ...
}: {
  imports = [
    ../../features/file-managers
    ../../features/window-managers
    ../../features/display-managers

    ../../features/acpi
    ../../features/audio
    ../../features/dconf
    ../../features/fonts
    ../../features/gnome-keyring
    ../../features/gtklock
    ../../features/hyprlock
    ../../features/plymouth
    ../../features/polkit
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
      greetd.enable = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "regreet") true;
      gtklock.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "sway") true;
      hyprlock.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "hyprland") true;
      hyprland.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "hyprland") true;
      awesome.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "awesome") true;
      plymouth.enable = true;
      polkit.enable = true;
      sddm.enable = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "sddm") true;
      silentBoot.enable = true;
      sway.enable = lib.mkIf (config.myOptions.bundles.desktopBase.windowManager == "sway") true;
    };
  };
}
