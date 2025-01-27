{
  pkgs,
  config,
  lib,
  ...
}:
# https://color.firefox.com/?theme=XQAAAALSAQAAAAAAAABBKYhm849SCicxcT-BCXcGHf3p79EhVPVD1H7xcfZ9PTtZXOCodCzcptiRYecKT8IAeEvOAieTrR8rb6tjInrOvZ5_6AiDksz6OlXheQQHZtX4DVgfQO-xmkMH-w_jtX2JdDIRwia4GNaVQY0RM1580FR6u18AKYpRXzZZDdKihXdSHtCwMBdsQ5yu9RRot9UTMDN6d8wg9X0Orz6DBCTGmrr3Ccz0Bc58g6jTjCHHk6M0VX3hG59wCe8WMUJqosq2PBi_MGk5OCzl2K62nnuf__VH6mg
let
  cursors = pkgs.callPackage ./paradise-cursors.nix {};
  icons = pkgs.callPackage ./paradise-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "paradise") {
    desktopTheme.base16Accent = "base0D";
    environment.systemPackages = [cursors icons];
    stylix = {
      cursor = {
        name = "BreezeX-Paradise";
        size = 32;
      };
      base16Scheme = {
        base00 = "151515";
        base01 = "1F1F1F";
        base02 = "2E2E2E";
        base03 = "424242";
        base04 = "BBB6B6";
        base05 = "E8E3E3";
        base06 = "E8E3E3";
        base07 = "E8E3E3";
        base08 = "B66467";
        base09 = "D9BC8C";
        base0A = "D9BC8C";
        base0B = "8C977D";
        base0C = "8AA6A2";
        base0D = "8DA3B9";
        base0E = "A988B0";
        base0F = "BBB6B6";
      };
    };
  };
}
