{
  pkgs,
  config,
  lib,
  ...
}: let
  tarotCursors = pkgs.callPackage ./tarot-cursors.nix {};
  tarotIcons = pkgs.callPackage ./tarot-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "tarot") {
    desktopTheme.base16Accent = "base0A";
    desktopTheme.iconTheme = {
      name = "Tarot-Icons";
      package = tarotIcons;
    };

    stylix = {
      cursor = {
        name = "Bibata-Tarot";
        package = tarotCursors;
      };
      base16Scheme = {
        base00 = "0E091D";
        base01 = "2A153C";
        base02 = "4B2054";
        base03 = "74316B";
        base04 = "8C406F";
        base05 = "C4686D";
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
