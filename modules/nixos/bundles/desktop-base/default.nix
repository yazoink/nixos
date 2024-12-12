{config, lib, ...}:
{
  imports = [
    ../../features/acpi
    ../../features/audio
    ../../features/dconf
    ../../features/fonts
    ../../features/gnome-keyring
    ../../features/hyprland
    ../../features/plymouth
    ../../features/polkit
    ../../features/sddm
    ../../features/silent-boot
    ../../features/theme
    ../../features/thunar
  ];

  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    myOptions.bundles.base.enable = true;
    bundles.desktopBase = {
      acpi.enable = true;
      audio.enable = true;
      dconf.enable = true;
      fonts.enable = true;
      gnomeKeyring.enable = true;
      hyprland.enable = true;
      plymouth.enable = true;
      polkit.enable = true;
      sddm.enable = true;
      silentBoot.enable = true;
      theme.enable = true;
      thunar.enable = true;
    };
    environment.localBinInPath = true;
  };
}
