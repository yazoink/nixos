{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "terracotta-light") {
    desktopTheme.base16Accent = "base0F";

    stylix = {
      polarity = "light";
      base16Scheme = {
        base00 = "EFEAE8";
        base01 = "DFD6D1";
        base02 = "D0C1BB";
        base03 = "C0ACA4";
        base04 = "59453D";
        base05 = "473731";
        base06 = "352A25";
        base07 = "241C19";
        base08 = "A75045";
        base09 = "BD6942";
        base0A = "CE943E";
        base0B = "7A894A";
        base0C = "847F9E";
        base0D = "625574";
        base0E = "8D5968";
        base0F = "B07158";
      };
    };
  };
}
