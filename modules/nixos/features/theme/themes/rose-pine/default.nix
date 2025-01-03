{pkgs, config, lib, ...}:
let
  rosepineIcons = pkgs.callPackage ./rosepine-icons.nix {};
in
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "rose-pine") {
    environment.systemPackages = [
      rosepineIcons
      pkgs.rose-pine-cursor
    ];

    desktopTheme.base16Accent = "base0B";

    stylix = {
      cursor = {
        name = "BreezeX-RosePine-Linux";
      };
      base16Scheme = {
        base00 = "191724";
        base01 = "1F1D2E";
        base02 = "26233A";
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
