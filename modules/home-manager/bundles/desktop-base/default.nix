{osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    bundles.desktopBase = builtins.trace "enabled desktopBase" {
      direnv.enable = true;
      dither.enable = true;
      hyprViewBinds.enable = true;
      mako.enable = true;
      replacecolor.enable = true;
      rofi.enable = true;
      screenshot.enable = true;
      simpleLogout.enable = true;
      waybar.enable = true;
      xdg.enable = true;
    };
  };

  imports = [
    ../../features/atril
    ../../features/direnv
    ../../features/dither
    ../../features/firefox
    ../../features/foot
    ../../features/file-roller
    ../../features/gtklock
    ../../features/hyprland
    ../../features/hyprviewbinds
    ../../features/mako
    ../../features/pluma
    ../../features/replacecolor
    ../../features/rofi
    ../../features/ristretto
    ../../features/screenshot
    ../../features/simple-logout
    ../../features/theme
    ../../features/vlc
    ../../features/waybar
    ../../features/xdg
  ];
}
