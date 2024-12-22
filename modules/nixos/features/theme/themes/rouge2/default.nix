{pkgs, config, lib, ...}:
let
  carolineCursors = pkgs.callPackage ./caroline-cursors.nix {};
  carolineIcons = pkgs.callPackage ./caroline-icons.nix {};
in
{
  config = lib.mkIf (config.myOptions.desktopTheme.enable && config.myOptions.desktopTheme.name == "rouge2") {
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
        base00 = "101127";
        base01 = "1e2048";
        base02 = "2f306a";
        base03 = "3e418e";
        base04 = "a1a1aa";
        base05 = "bcbcc2";
        base06 = "d7d7db";
        base07 = "e9e9eb";
        base08 = "C77A7F";
        base09 = "5D5D6B";
        base0A = "DCCEAD";
        base0B = "979F93";
        base0C = "8BB7C2";
        base0D = "6E95BA";
        base0E = "4B4D79";
        base0F = "5D5D6B";
      };
    };
  };
}
