{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./levuaska-cursors.nix {};
  icons = pkgs.callPackage ./levuaska-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "levuaska") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.iconTheme = {
      name = "Papirus-Levuaska";
      package = icons;
    };
    environment.systemPackages = [cursors icons];
    stylix = {
      cursor = {
        name = "BreezeX-Levuaska";
        size = 32;
      };
      base16Scheme = {
        base00 = "0f0f17";
        base01 = "1B1B24";
        base02 = "262831";
        base03 = "32343E";
        base04 = "6D7280";
        base05 = "bfc9db";
        base06 = "BFC9DB";
        base07 = "C5CEDE";
        base08 = "d78787";
        base09 = "E0B089";
        base0A = "e4c9af";
        base0B = "afbea2";
        base0C = "b1e7dd";
        base0D = "a1bdce";
        base0E = "d7beda";
        base0F = "F2CDCD";
      };
    };
  };
}
