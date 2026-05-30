{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "crayon") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "101112";
        base01 = "282C33";
        base02 = "383E47";
        base03 = "586270";
        base04 = "798494";
        base05 = "BCC5D1";
        base06 = "D8D8D8";
        base07 = "FDFEFF";
        base08 = "B27B78";
        base09 = "C48D62";
        base0A = "D8C27A";
        base0B = "99AE63";
        base0C = "8DC9C3";
        base0D = "7495B6";
        base0E = "B59CD8";
        base0F = "CC99B3";
      };
    };
  };
}
