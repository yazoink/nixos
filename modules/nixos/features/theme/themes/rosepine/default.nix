{pkgs, config, lib, ...}:
let
  rosepineCursors = pkgs.callPackage ./rosepine-cursors.nix {};
  rosepineIcons = pkgs.callPackage ./rosepine-icons.nix {};
in
{
  config = lib.mkIf (config.myOptions.desktopTheme.enable && config.myOptions.desktopTheme.name == "rosepine") {
    environment.systemPackages = [
      rosepineCursors
      rosepineIcons
    ];

    desktopTheme.base16Accent = "base0B";

    stylix = {
      cursor = {
        name = "Bibata-Rose-Pine";
      };
      base16Scheme = {
        base00 = "232136";
        base01 = "2A273F";
        base02 = "393552";
        base03 = "6E6A86";
        base04 = "908CAA";
        base05 = "E0DEF4";
        base06 = "E0DEF4";
        base07 = "56526E";
        base08 = "EB6F92";
        base09 = "F6C177";
        base0A = "EA9A97";
        base0B = "3E8FB0";
        base0C = "9CCFD8";
        base0D = "C4A7E7";
        base0E = "F6C177";
        base0F = "56526E";
      };
    };
  };
}
