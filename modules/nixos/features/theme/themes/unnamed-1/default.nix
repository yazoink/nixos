{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "unnamed-1") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "1A181D";
        base01 = "2A252C";
        base02 = "3C313D";
        base03 = "54444E";
        base04 = "7B6872";
        base05 = "E5C0CB";
        base06 = "E5C0CB";
        base07 = "E5C0CB";
        base08 = "D1485F";
        base09 = "B67057";
        base0A = "D08E56";
        base0B = "6F735D";
        base0C = "8C7F77";
        base0D = "7A6379";
        base0E = "9E4974";
        base0F = "82524A";
      };
    };
  };
}
