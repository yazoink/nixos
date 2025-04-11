{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "jardo-brighter") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "000000";
        base01 = "323330";
        base02 = "50514D";
        base03 = "7F8079";
        base04 = "E0E1DC";
        base05 = "F0F1EA";
        base06 = "F7F0F1";
        base07 = "FDFFF7";
        base08 = "FF9EA3";
        base09 = "FFBF9C";
        base0A = "FFE492";
        base0B = "E8FFAA";
        base0C = "ADFFDC";
        base0D = "B1E4FC";
        base0E = "F8D7FF";
        base0F = "F1CBB3";
      };
    };
  };
}
