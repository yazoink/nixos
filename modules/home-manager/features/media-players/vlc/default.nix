{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.mediaPlayer.command == "vlc") {
    home.packages = [pkgs.vlc];
  };
}
