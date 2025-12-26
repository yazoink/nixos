{
  pkgs,
  config,
  lib,
  ...
}: let
  carolineCursors = pkgs.callPackage ./caroline-cursors.nix {};
  carolineIcons = pkgs.callPackage ./caroline-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "caroline") {
    desktopTheme.base16Accent = "base0F";
    desktopTheme.iconTheme = {
      name = "caroline-suru-aspromauros";
      package = carolineIcons;
    };

    stylix = {
      cursor = {
        name = "caroline-bibata-modern";
        package = carolineCursors;
      };
      /*
         http://dotshare.it/dots/1416/
      base16Scheme = {
        base00 = "0E181A";
        base01 = "192225";
        base02 = "242D30";
        base03 = "30383B";
        base04 = "B07D71";
        base05 = "D8A396";
        base06 = "D8A396";
        base07 = "D8A396";
        base08 = "494A3E";
        base09 = "666465";
        base0A = "B04F41";
        base0B = "9C5033";
        base0C = "A95E4F";
        base0D = "6D826F";
        base0E = "CA8D67";
        base0F = "B04F41";
      };
      */
      /*
         wizard
      base16Scheme = {
        base00 = "1B0823";
        base01 = "371F2E";
        base02 = "53373A";
        base03 = "6F4E45";
        base04 = "A77D5C";
        base05 = "DFAC73";
        base06 = "DFAC73";
        base07 = "DFAC73";
        base08 = "CF320B";
        base09 = "EC8731";
        base0A = "F0BB30";
        base0B = "757A44";
        base0C = "879872";
        base0D = "727085";
        base0E = "9A1120";
        base0F = "8A3338";
      };
      */
      /*
         zephyr
      base16Scheme = {
        base00 = "2E242D";
        base01 = "47393C";
        base02 = "604F4B";
        base03 = "6E5C56";
        base04 = "AB8E79";
        base05 = "DDB997";
        base06 = "DDB997";
        base07 = "DDB997";
        base08 = "C46169";
        base09 = "984343";
        base0A = "81675C";
        base0B = "948E80";
        base0C = "6A6C7F";
        base0D = "835669";
        base0E = "AB6379";
        base0F = "6C545E";
      };
      */
      base16Scheme = {
        base00 = "1c1213";
        base01 = "3a2425";
        base02 = "563837";
        base03 = "6d4745";
        base04 = "8b5d57";
        base05 = "a87569";
        base06 = "a87569";
        base07 = "a87569";
        base08 = "c24f57";
        base09 = "a63650";
        base0A = "f28171";
        base0B = "806c61";
        base0C = "6b6566";
        base0D = "684c59";
        base0E = "a63650";
        base0F = "893f45";
      };
    };
  };
}
