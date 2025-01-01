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
    ../../features/gui-editors
    ../../features/document-readers
    ../../features/terminals
    ../../features/archivers
    ../../features/browsers
    ../../features/image-viewers
    ../../features/media-players

    ../../features/direnv
    ../../features/dither
    ../../features/gtklock
    ../../features/hyprland
    ../../features/hyprviewbinds
    ../../features/mako
    ../../features/replacecolor
    ../../features/rofi
    ../../features/screenshot
    ../../features/simple-logout
    ../../features/theme
    ../../features/waybar
    ../../features/xdg
  ];
}
