{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.imageViewer.command == "ristretto") {
    defaultApps.imageViewer.desktopFile = "org.xfce.ristretto.desktop";
    home.packages = [pkgs.xfce.ristretto];
  };
}
