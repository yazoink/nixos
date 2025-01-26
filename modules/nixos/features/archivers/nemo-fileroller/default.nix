{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.archiver.command == "nemo-fileroller") {
    environment.systemPackages = [pkgs.nemo-fileroller];
  };
}
