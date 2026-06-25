{
  pkgs,
  config,
  lib,
  ...
}: let
  carobTheme = pkgs.callPackage ./carob-theme.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "carob") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.icons = {
      name = "Carob";
      package = carobTheme;
    };

    stylix = {
      cursor = {
        name = "Bibata-Carob";
        package = carobTheme;
        # size = 24;
      };
      base16Scheme = {
        base00 = "242120";
        base01 = "2F2B29";
        base02 = "3A3532";
        base03 = "45403A";
        base04 = "71685E";
        base05 = "C8BAA4";
        base06 = "C8BAA4";
        base07 = "C8BAA4";
        base08 = "C65F5F";
        base09 = "d08b65";
        base0A = "d9b27c";
        base0B = "859e82";
        base0C = "829e9b";
        base0D = "728797";
        base0E = "998396";
        base0F = "ab9382";
      };
    };
  };
}
