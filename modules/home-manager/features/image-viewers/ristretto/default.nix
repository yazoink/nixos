{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.imageViewer.command == "ristretto") {
    defaultApps.imageViewer.desktopFile = "ristretto.desktop";
    home.packages = [pkgs.xfce.ristretto];
  };
}
