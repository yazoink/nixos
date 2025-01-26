{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.archiver.command == "engrampa") {
    environment.systemPackages = [pkgs.mate.engrampa];
    myOptions.defaultApps.archiver.desktopFile = lib.mkDefault "engrampa.desktop";
  };
}
