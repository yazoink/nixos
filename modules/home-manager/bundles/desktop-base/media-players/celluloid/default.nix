{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.mediaPlayer.command == "celluloid") {
    defaultApps.mediaPlayer.desktopFile = "celluloid.desktop";
    home.packages = [pkgs.celluloid];
  };
}
