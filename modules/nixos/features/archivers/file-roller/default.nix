{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.archiver.command == "file-roller") {
    programs.file-roller.enable = true;
    myOptions.defaultApps.archiver.desktopFile = lib.mkDefault "org.gnome.FileRoller.desktop";
  };
}
