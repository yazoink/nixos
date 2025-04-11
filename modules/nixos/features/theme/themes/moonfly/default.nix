{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "moonfly") {
    desktopTheme.base16Accent = "base0D";

    environment.systemPackages = [cursors];
    stylix = {
      cursor = {
        name = "BreezeX-Moonfly";
        size = 32;
      };
    };

    stylix = {
      base16Scheme = {
        base00 = "080808";
        base01 = "141414";
        base02 = "202020";
        base03 = "2C2C2C";
        base04 = "696969";
        base05 = "BDBDBD";
        base06 = "BDBDBD";
        base07 = "BDBDBD";
        base08 = "FF5D5D";
        base09 = "F19274";
        base0A = "E3C78A";
        base0B = "8CC85F";
        base0C = "79DAC8";
        base0D = "80A0FF";
        base0E = "CF87E8";
        base0F = "F87869";
      };
    };
  };
}
