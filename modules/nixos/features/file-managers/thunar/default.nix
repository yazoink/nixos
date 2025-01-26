{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.defaultApps.fileManager.command == "thunar") {
    programs = {
      file-roller.enable = true;
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

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
