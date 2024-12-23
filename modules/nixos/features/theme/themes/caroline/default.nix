{pkgs, config, lib, ...}:
let
  carolineCursors = pkgs.callPackage ./caroline-cursors.nix {};
  carolineIcons = pkgs.callPackage ./caroline-icons.nix {};
in
{
  config = lib.mkIf (config.myOptions.desktopTheme.enable && config.myOptions.desktopTheme.name == "caroline") {
    environment.systemPackages = [
      carolineCursors
      carolineIcons
    ];

    desktopTheme.base16Accent = "base0F";

    stylix = {
      cursor = {
        name = "caroline-bibata-modern";
      };
      base16Scheme = {
        base00 = "0E181A";
        base01 = "1B2E32";
        base02 = "2D4D53";
        base03 = "3E6C74";
        base04 = "CF8D7D";
        base05 = "D8A396";
        base06 = "E3BEB5";
        base07 = "E3BEB5";
        base08 = "494A3E";
        base09 = "666465";
        base0A = "B04F41";
        base0B = "9C5033";
        base0C = "A95E4F";
        base0D = "6D826F";
        base0E = "CA8D67";
        base0F = "B04F41";
      };
      /*base16Scheme = {
        base00 = "1c1213";
        base01 = "3a2425";
        base02 = "563837";
        base03 = "6d4745";
        base04 = "8b5d57";
        base05 = "a87569";
        base06 = "c58d7b";
        base07 = "e3a68c";
        base08 = "c24f57";
        base09 = "a63650";
        base0A = "f28171";
        base0B = "806c61";
        base0C = "6b6566";
        base0D = "684c59";
        base0E = "a63650";
        base0F = "893f45";
      };*/
    };
  };
}
