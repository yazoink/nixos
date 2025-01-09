{pkgs, lib, config, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.archiver.command == "file-roller") {
    environment.systemPackages = [pkgs.file-roller];
  };
}
