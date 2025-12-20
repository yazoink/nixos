{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "vase") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "24231F";
        base01 = "2F2E29";
        base02 = "393932";
        base03 = "44443C";
        base04 = "797A6D";
        base05 = "C3C6B1";
        base06 = "C3C6B1";
        base07 = "C3C6B1";
        base08 = "B85F5B";
        base09 = "BF6501";
        base0A = "DF8C29";
        base0B = "929472";
        base0C = "6B776C";
        base0D = "829397";
        base0E = "934147";
        base0F = "A45A3F";
      };
    };
  };
}
