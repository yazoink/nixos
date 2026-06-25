{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Terminus") {
    stylix = {
      fonts = {
        monospace = {
          name = "Terminus";
          package = pkgs.terminus_font;
        };
      };
    };
  };
}
