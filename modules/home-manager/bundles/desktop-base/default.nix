{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    bundles.desktopBase = builtins.trace "enabled desktopBase" {
      direnv.enable = true;
      xdg.enable = true;
    };
    home.packages = with pkgs; [keepassxc];
  };

  imports = [
    ../../features/gui-text-editors
    ../../features/document-readers
    ../../features/terminals
    ../../features/web-browsers
    ../../features/image-viewers
    ../../features/media-players
    ../../features/window-managers
    ../../features/notifications
    ../../features/launchers
    ../../features/bars
    ../../features/lockscreens

    ../../features/direnv
    ../../features/hyprviewbinds
    ../../features/screenshot
    ../../features/simple-logout
    ../../features/theme
    ../../features/xdg
    ../../features/dconf
    ../../features/swayosd
    ../../features/eww
  ];
}
