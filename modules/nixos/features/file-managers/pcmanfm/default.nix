{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.fileManager.command == "pcmanfm") {
    programs = {
      file-roller.enable = true;
    };

    environment.systemPackages = with pkgs; [pcmanfm cifs-utils];

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
