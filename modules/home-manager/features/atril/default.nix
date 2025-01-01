{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.documentReader.command == "atril") {
    home.packages = [pkgs.mate.atril];
  };
}
