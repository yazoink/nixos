{
  pkgs,
  config,
  lib,
  ...
}: let
  rosepineCursors = pkgs.callPackage ./rosepine-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "rose-pine-moon") {
    desktopTheme.base16Accent = "base0B";
    desktopTheme.iconTheme = {
      name = "Rose-Pine-Moon";
      package = pkgs.rosepineIcons;
    };

    stylix = {
      cursor = {
        name = "Bibata-Rose-Pine";
        package = rosepineCursors;
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
