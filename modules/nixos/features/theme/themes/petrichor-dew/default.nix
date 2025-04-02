{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "petrichor-dew") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "1C1C20";
        base01 = "25252A";
        base02 = "2D2E34";
        base03 = "36373E";
        base04 = "606370";
        base05 = "9CA1B6";
        base06 = "9CA1B6";
        base07 = "9CA1B6";
        base08 = "906775";
        base09 = "9E7675";
        base0A = "AB8575";
        base0B = "947F6B";
        base0C = "86A6A6";
        base0D = "858DB3";
        base0E = "927AA3";
        base0F = "835E6A";
      };
    };
  };
}
