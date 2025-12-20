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
    ../../rices

    ../../features/gui-text-editors
    ../../features/document-readers
    ../../features/terminals
    ../../features/web-browsers
    ../../features/image-viewers
    ../../features/media-players

    ../../features/direnv
    ../../features/hyprviewbinds
    ../../features/simple-logout
    ../../features/theme
    ../../features/xdg
    ../../features/dconf
    # ../../features/hyprland-monitor-attached
  ];
}
