{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "bluevelvet") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "0B0F1C";
        base01 = "1C1F29";
        base02 = "292D3C";
        base03 = "3F4354";
        base04 = "5D6176";
        base05 = "B0AEB6";
        base06 = "B0AEB6";
        base07 = "B0AEB6";
        base08 = "9B2D33";
        base09 = "D77A42";
        base0A = "BB8A4F";
        base0B = "4B6A4E";
        base0C = "587D8B";
        base0D = "45718D";
        base0E = "6E4F69";
        base0F = "7B4D36";
      };
    };
  };
}
