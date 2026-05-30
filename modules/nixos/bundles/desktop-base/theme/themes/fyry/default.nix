{
  pkgs,
  config,
  lib,
  ...
}:
# http://dotshare.it/dots/1156
let
  cursors = pkgs.callPackage ./fyry-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "fyry") {
    desktopTheme.base16Accent = "base0D";
    environment.systemPackages = [cursors];
    stylix = {
      cursor = {
        name = "BreezeX-Fyry";
        size = 32;
      };
      base16Scheme = {
        base00 = "03070b";
        base01 = "111519";
        base02 = "1f2326";
        base03 = "2d3134";
        base04 = "747678";
        base05 = "d7d7d7";
        base06 = "d7d7d7";
        base07 = "d7d7d7";
        base08 = "b23450";
        base09 = "9f725b";
        base0A = "b28c55";
        base0B = "7b8c58";
        base0C = "737373";
        base0D = "58698c";
        base0E = "8c5760";
        base0F = "a95356";
      };
    };
  };
}
