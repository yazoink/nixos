#https://color.firefox.com/?theme=XQAAAAKbAwAAAAAAAABBqYhm849SCicxcUUSqiuG_ebZUZXOFqnzRdaV_86CpmztLEvUrYGe13WY0163zBXG0AaReKVNGBPRn-cOW4K9hhPpYa1El0o6aywjeorKsw1-FZFma4BAIMtncRw_C035LZIO605Cq0J_oouRleL8LpCSrhq9ZFmXszMJDRRwzc-v9gEj-UZz1xfXzsohcCim4FP4hbr-0YWIfjw51FDvIZhOKlIZ60AuH1Nk3Dx4ySmW4zBSKyV_m0u0J2IPxtdl1O4TyOL3qp_BhxOnK5quXWfcfJPsK7tOSoRf18_sW1meHt7Gllcmwek_h4a6qlt9Rl_MWbkSYZ32bWapaPdvY3V2o8BwXsoPCGxgCZg_gSM0EMYvrkmBkUXOaBaqfoH0Zqx7mmh9NOtAm8ODv4pupsbtZolRcRthwmrinEnEt6DSP1sqxFwXTU8Tx41CtGpfBEPB9QuFXpL9EEHR
{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./gruvbox-dark-hard-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "gruvbox-dark-hard") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    stylix = {
      cursor = {
        name = "BreezeX-Gruvbox-Dark-Hard";
        size = 32;
        package = cursors;
      };
      base16Scheme = {
        base00 = "1D2021";
        base01 = "3C3836";
        base02 = "504945";
        base03 = "665C54";
        base04 = "BDAE93";
        base05 = "D5C4A1";
        base06 = "EBDBB2";
        base07 = "FBF1C7";
        base08 = "FB4934";
        base09 = "FE8019";
        base0A = "FABD2F";
        base0B = "B8BB26";
        base0C = "8EC07C";
        base0D = "83A598";
        base0E = "D3869B";
        base0F = "D65D0E";
      };
    };
  };
}
