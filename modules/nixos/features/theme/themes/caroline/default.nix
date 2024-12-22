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
      base16Scheme = {
        base00 = "241D1A";
        base01 = "362B27";
        base02 = "473933";
        base03 = "594740";
        base04 = "A78E84";
        base05 = "B8A59D";
        base06 = "CABBB5";
        base07 = "DCD2CE";
        base08 = "F6998F";
        base09 = "FFA888";
        base0A = "FFC37A";
        base0B = "B6C68A";
        base0C = "C0BCDB";
        base0D = "B0A4C3";
        base0E = "D8A2B0";
        base0F = "F1AE97";
      };
    };
  };
}
