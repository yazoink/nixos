{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.imageViewer.command == "ristretto") {
    home.packages = [pkgs.xfce.ristretto];
  };
}
