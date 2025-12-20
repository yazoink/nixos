#https://color.firefox.com/?theme=XQAAAAKbAwAAAAAAAABBqYhm849SCicxcUUSqiuG_ebZUZXOFqnzRdaV_86CpmztLEvUrYGe13WY0163zBXG0AaReKVNGBPRn-cOW4K9hhPpYa1El0o6aywjeorKsw1-FZFma4BAIMtncRw_C035LZIO605Cq0J_oouRleL8LpCSrhq9ZFmXszMJDRRwzc-v9gEj-UZz1xfXzsohcCim4FP4hbr-0YWIfjw51FDvIZhOKlIZ60AuH1Nk3Dx4ySmW4zBSKyV_m0u0J2IPxtdl1O4TyOL3qp_BhxOnK5quXWfcfJPsK7tOSoRf18_sW1meHt7Gllcmwek_h4a6qlt9Rl_MWbkSYZ32bWapaPdvY3V2o8BwXsoPCGxgCZg_gSM0EMYvrkmBkUXOaBaqfoH0Zqx7mmh9NOtAm8ODv4pupsbtZolRcRthwmrinEnEt6DSP1sqxFwXTU8Tx41CtGpfBEPB9QuFXpL9EEHR
{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./gruvbox-material-dark-hard-cursors.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "gruvbox-material-dark-hard") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    stylix = {
      cursor = {
        name = "BreezeX-Gruvbox-Material-Dark-Hard";
        package = cursors;
        size = 32;
      };
      /*
        base16Scheme = {
        base00 = "1D2021";
        base01 = "282828";
        base02 = "3C3836";
        base03 = "504945";
        base04 = "A89984";
        base05 = "D4BE98";
        base06 = "D4BE98";
        base07 = "DDC7A1";
        base08 = "EA6962";
        base09 = "E78A4E";
        base0A = "D8A657";
        base0B = "A9B665";
        base0C = "89B482";
        base0D = "7DAEA3";
        base0E = "D3869B";
        base0F = "E78A4E";
      };
      */
      base16Scheme = {
        base00 = "202020";
        base01 = "2A2827";
        base02 = "504945";
        base03 = "5A524C";
        base04 = "BDAE93";
        base05 = "DDC7A1";
        base06 = "EBDBB2";
        base07 = "FBF1C7";
        base08 = "EA6962";
        base09 = "E78A4E";
        base0A = "D8A657";
        base0B = "A9B665";
        base0C = "89B482";
        base0D = "7DAEA3";
        base0E = "D3869B";
        base0F = "E78A4E";
      };
    };
  };
}
