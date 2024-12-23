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
        base00 = "00132D";
        base01 = "00204D";
        base02 = "003580";
        base03 = "004AB3";
        base04 = "A97094";
        base05 = "BC90AC";
        base06 = "CFAFC4";
        base07 = "E2CFDB";
        base08 = "8F1E22";
        base09 = "B2301B";
        base0A = "DFB859";
        base0B = "505745";
        base0C = "4451AA";
        base0D = "543566";
        base0E = "8B84D1";
        base0F = "65503B";
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
