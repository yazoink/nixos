{
  config,
  lib,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "ly" && config.myOptions.bundles.desktopBase.enable) {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "gameoflife";
        bg = "0X00${colors.base00}";
        fg = "0X00${colors.base05}";
        error_fg = "0X01${colors.base08}";
        border_fg = "0x00${colors.base05}";
        colormix_col1 = "0x00${colors.base08}";
        colormix_col2 = "0x00${colors.base0B}";
        colormix_col3 = "0x00${colors.base0D}";
      };
    };
  };
}
