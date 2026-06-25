{pkgs, ...}: let
  cursors = pkgs.callPackage ./gruvbox-material-dark-hard-cursors.nix {};
in {
  icons = {
    dark = "Gruvbox-Plus-Dark";
    package = pkgs.gruvbox-plus-icons;
  };

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
}
