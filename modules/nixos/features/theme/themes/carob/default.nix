{
  pkgs,
  config,
  lib,
  ...
}: let
  carobTheme = pkgs.callPackage ./carob-theme.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "carob") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.iconTheme = {
      name = "Carob";
      package = carobTheme;
    };

    stylix = {
      cursor = {
        name = "Bibata-Carob";
        package = carobTheme;
      };
      base16Scheme = {
        base00 = "242120";
        base01 = "2b2726";
        base02 = "332e2b";
        base03 = "3b3431";
        base04 = "ad9b84";
        base05 = "b5a48d";
        base06 = "bdae97";
        base07 = "c8baa4";
        base08 = "c65f5f";
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
