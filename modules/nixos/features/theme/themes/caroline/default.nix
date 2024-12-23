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
      /* http://dotshare.it/dots/1416/
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
      };*/
      base16Scheme = {
        base00 = "292A2A";
        base01 = "403E38";
        base02 = "575347";
        base03 = "6E6755";
        base04 = "9C9071";
        base05 = "CAB98E";
        base06 = "CAB98E";
        base07 = "CAB98E";
        base08 = "C24B47";
        base09 = "A64D3D";
        base0A = "9A8351";
        base0B = "658254";
        base0C = "424977";
        base0D = "34748D";
        base0E = "876250";
        base0F = "7A5646";
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
