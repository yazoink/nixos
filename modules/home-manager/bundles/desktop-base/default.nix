{osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    bundles.desktopBase = builtins.trace "enabled desktopBase" {
      direnv.enable = true;
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
    ../../features/window-managers
    ../../features/notifications

    ../../features/direnv
    ../../features/gtklock
    ../../features/hyprviewbinds
    ../../features/rofi
    ../../features/screenshot
    ../../features/simple-logout
    ../../features/theme
    ../../features/waybar
    ../../features/xdg
  ];
}
