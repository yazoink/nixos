{
  lib,
  osConfig,
  config,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.imageViewer.command == "imv") {
    defaultApps.imageViewer.desktopFile = "imv-dir.desktop";
    programs.imv = {
      enable = true;
      settings = {
        options = {
          fullscreen = false;
          width = 640;
          height = 480;
          overlay = false;
          overlay_font = "sans:${builtins.toString config.gtk.font.size}";
          scaling_mode = "full";
        };
        aliases.x = "close";
      };
    };
  };
}
