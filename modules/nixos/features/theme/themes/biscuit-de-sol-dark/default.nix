{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./biscuit-cursors.nix {};
  icons = pkgs.callPackage ./biscuit-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "biscuit-de-sol-dark") {
    environment.systemPackages = [
      cursors
      icons
    ];

    desktopTheme.base16Accent = "base0D";
    desktopTheme.iconTheme = {
      name = "papirus-biscuit-dark";
      package = icons;
    };

    stylix = {
      cursor = {
        name = "BreezeX-Biscuit";
        size = 32;
        package = cursors;
      };
      base16Scheme = {
        base00 = "181515";
        base01 = "221E1E";
        base02 = "221E1E";
        base03 = "6D5F5F";
        base04 = "978787";
        base05 = "B6A8A5";
        base06 = "F4E6D2";
        base07 = "CA3F3F";
        base08 = "E46A3A";
        base09 = "E39C45";
        base0A = "989F56";
        base0B = "629386";
        base0C = "517894";
        base0D = "4A5A8D";
        base0E = "9F569A";
        base0F = "C45497";
      };
    };
  };
}
