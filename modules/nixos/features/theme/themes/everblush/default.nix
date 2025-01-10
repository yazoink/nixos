{pkgs, config, lib, ...}:
let
  cursors = pkgs.callPackage ./everblush-cursors.nix {};
in
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "everblush") {
    environment.systemPackages = [
      cursors
    ];

    desktopTheme.base16Accent = "base0C";

    stylix = {
      cursor = {
        name = "BreezeX-Everblush";
        size = 32;
      };
      base16Scheme = {
        base00 = "141B1E";
        base01 = "1C2326";
        base02 = "232A2D";
        base03 = "353C3F";
        base04 = "B3B9B8";
        base05 = "DADADA";
        base06 = "DADADA";
        base07 = "DDDDDD";
        base08 = "E57474";
        base09 = "E59E70";
        base0A = "E5C76B";
        base0B = "8CCF7E";
        base0C = "6CBFBF";
        base0D = "67B0E8";
        base0E = "C47FD5";
        base0F = "CD6B6C";
      };
    };
  };
}
