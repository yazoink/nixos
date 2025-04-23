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
          background = config.stylix.base16Scheme.base00;
          fullscreen = false;
          width = 640;
          height = 480;
          overlay = false;
          overlay_font = "${config.stylix.fonts.sansSerif.name}:${builtins.toString config.stylix.fonts.sizes.applications}";
          scaling_mode = "full";
        };
        aliases.x = "close";
      };
    };
  };
}
