{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./biscuit-cursors.nix {};
  icons = pkgs.callPackage ./biscuit-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "biscuit-de-sol-light") {
    environment.systemPackages = [
      cursors
      icons
    ];

    desktopTheme.base16Accent = "base0D";

    stylix = {
      polarity = "light";
      cursor = {
        name = "BreezeX-Biscuit";
        size = 32;
        package = cursors;
      };
      base16Scheme = {
        base00 = "F4E6D2";
        base01 = "DBC6C2";
        base02 = "B79F9F";
        base03 = "A18787";
        base04 = "423939";
        base05 = "2B2626";
        base06 = "181515";
        base07 = "CB2424";
        base08 = "E95318";
        base09 = "E98F21";
        base0A = "9BA636";
        base0B = "3E9F85";
        base0C = "34709B";
        base0D = "2F4692";
        base0E = "A6369F";
        base0F = "CF2D8E";
      };
    };
  };
}
