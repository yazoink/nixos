{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./biscuit-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "biscuit-de-mar-light") {
    environment.systemPackages = [
      cursors
    ];

    desktopTheme.base16Accent = "base0D";

    stylix = {
      polarity = "light";
      base16Scheme = {
        base00 = "FFF7EB";
        base01 = "E0CFC6";
        base02 = "C1AEAE";
        base03 = "A38A8A";
        base04 = "9C8181";
        base05 = "483939";
        base06 = "2D2424";
        base07 = "AE4750";
        base08 = "C6695D";
        base09 = "CD9165";
        base0A = "97916F";
        base0B = "7A7F7F";
        base0C = "7B727E";
        base0D = "79657A";
        base0E = "83546B";
        base0F = "A05A78";
      };
    };
  };
}
