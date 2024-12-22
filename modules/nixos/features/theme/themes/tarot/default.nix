{pkgs, config, lib, ...}:
let
  carolineCursors = pkgs.callPackage ./caroline-cursors.nix {};
  carolineIcons = pkgs.callPackage ./caroline-icons.nix {};
in
{
  config = lib.mkIf (config.myOptions.desktopTheme.enable && config.myOptions.desktopTheme.name == "tarot") {
    environment.systemPackages = [
      carolineCursors
      carolineIcons
    ];

    #desktopTheme.base16Accent = "base09";

    stylix = {
      cursor = {
        name = "caroline-bibata-modern";
      };
      base16Scheme = {
        base00 = "0E091D";
        base01 = "2A153C";
        base02 = "4B2054";
        base03 = "74316B";
        base04 = "8C406F";
        base05 = "AA556F";
        base06 = "C4686D";
        base07 = "DC8F7C";
        base08 = "C53253";
        base09 = "EA4D60";
        base0A = "FF6565";
        base0B = "A68E5A";
        base0C = "8C9785";
        base0D = "6E6080";
        base0E = "A45782";
        base0F = "984D51";
      };
    };
  };
}
