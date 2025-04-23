{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.mediaPlayer.command == "vlc") {
    defaultApps.mediaPlayer.desktopFile = "vlc.desktop";
    home.packages = [pkgs.vlc];
  };
}
