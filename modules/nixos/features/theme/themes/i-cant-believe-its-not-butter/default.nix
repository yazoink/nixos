{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "i-cant-believe-its-not-butter") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "101012";
        base01 = "1F1E1F";
        base02 = "2D2B2C";
        base03 = "3C3939";
        base04 = "867D79";
        base05 = "EDDCD3";
        base06 = "EDDCD3";
        base07 = "EDDCD3";
        base08 = "CD546C";
        base09 = "A54242";
        base0A = "CD7860";
        base0B = "A5AF86";
        base0C = "767D75";
        base0D = "7A9388";
        base0E = "917154";
        base0F = "A54242";
      };
    };
  };
}
