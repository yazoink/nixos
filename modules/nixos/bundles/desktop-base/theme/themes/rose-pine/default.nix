{
  pkgs,
  config,
  lib,
  ...
}: let
  icons = pkgs.callPackage ./icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "rose-pine") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.icons = {
      name = "Rose-Pine";
      package = icons;
    };

    stylix = {
      cursor = {
        name = "BreezeX-RosePine-Linux";
        package = pkgs.rose-pine-cursor;
        size = 32;
      };
      /*
        base16Scheme = {
        base00 = "191724";
        base01 = "262432";
        base02 = "343240";
        base03 = "413F4E";
        base04 = "838193";
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
      */
      base16Scheme = {
        base00 = "191724";
        base01 = "1F1D2E";
        base02 = "26233A";
        base03 = "403D52";
        base04 = "524F67";
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
