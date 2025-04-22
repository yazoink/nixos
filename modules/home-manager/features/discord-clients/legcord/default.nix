{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  themeFile = config.lib.stylix.colors {
    template =
      if (osConfig.myOptions.desktopTheme.name == "catppuccin-mocha")
      then ./catppuccin.theme.css.mustache
      else ./my.theme.css.mustache;
    extension = ".css";
  };
in {
  config = lib.mkIf (osConfig.myOptions.defaultApps.discordClient.command == "legcord" && osConfig.myOptions.bundles.desktopFull.enable) {
    xdg.configFile = {
      "legcord/quickCss.css".text =
        builtins.readFile themeFile
        + ''
          :root {
            --font: ${config.stylix.fonts.sansSerif.name};
            --font-primary: ${config.stylix.fonts.sansSerif.name};
            --font-display: ${config.stylix.fonts.sansSerif.name};
          }

          * {
            font-family: ${config.stylix.fonts.sansSerif.name};
          }

          body {
            --font: ${config.stylix.fonts.sansSerif.name};
            --font-primary: ${config.stylix.fonts.sansSerif.name};
            --font-display: ${config.stylix.fonts.sansSerif.name};
          }
        '';
    };
    home.packages = with pkgs; [legcord];
  };
}
