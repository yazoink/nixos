{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.fileManager.command == "pcmanfm") {
    environment.systemPackages = with pkgs; [nemo-with-extensions cifs-utils];

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
