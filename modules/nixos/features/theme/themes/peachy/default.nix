{
  pkgs,
  config,
  lib,
  ...
}:
# I made this one
let
  cursors = pkgs.callPackage ./peachy-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "peachy") {
    desktopTheme.base16Accent = "base0F";
    environment.systemPackages = [cursors];
    stylix = {
      cursor = {
        name = "BreezeX-Peachy";
        size = 32;
      };
      base16Scheme = {
        base00 = "101617";
        base01 = "1F2321";
        base02 = "2D2F2B";
        base03 = "3B3B35";
        base04 = "BBA88D";
        base05 = "F3D8B4";
        base06 = "F3D8B4";
        base07 = "F4DCBB";
        base08 = "AC7967";
        base09 = "CD8E6F";
        base0A = "E09F71";
        base0B = "928572";
        base0C = "839083";
        base0D = "778577";
        base0E = "AF8871";
        base0F = "9C6E5E";
      };
    };
  };
}
