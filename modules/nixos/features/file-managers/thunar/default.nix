{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.fileManager.command == "thunar") {
    defaultApps.fileManager.desktopFile = "thunar.desktop";
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
          thunar-media-tags-plugin
        ];
      };
      xfconf.enable = true;
    };

    environment.systemPackages = with pkgs; file-roller;

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
