{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./biscuit-cursors.nix {};
  icons = pkgs.callPackage ./biscuit-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "biscuit-de-mar-dark") {
    environment.systemPackages = [
      cursors
      icons
    ];

    desktopTheme.base16Accent = "base0D";

    stylix = {
      cursor = {
        name = "BreezeX-Biscuit";
        size = 32;
        package = cursors;
      };
      base16Scheme = {
        base00 = "1A1515";
        base01 = "2D2424";
        base02 = "483939";
        base03 = "725A5A";
        base04 = "9C8181";
        base05 = "DCC9BC";
        base06 = "FFE9C7";
        base07 = "CF2238";
        base08 = "F06842";
        base09 = "E38945";
        base0A = "968F6B";
        base0B = "7C8A7E";
        base0C = "7C6D8B";
        base0D = "5D548C";
        base0E = "7B3D79";
        base0F = "AE3F73";
      };
    };
  };
}
