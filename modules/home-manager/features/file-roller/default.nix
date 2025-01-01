{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.archiver.command == "file-roller") {
    home.packages = [pkgs.file-roller];
  };
}
