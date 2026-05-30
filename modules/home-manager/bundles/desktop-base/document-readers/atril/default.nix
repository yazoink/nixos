{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.documentReader.command == "atril") {
    defaultApps.documentReader.desktopFile = "atril.desktop";
    home.packages = [pkgs.mate.atril];
  };
}
