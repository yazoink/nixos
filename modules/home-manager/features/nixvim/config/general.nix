{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme;
in {
  colorschemes.base16 = lib.mkIf (config.stylix.polarity == "light") {
    enable = true;
    colorscheme = {
      base00 = "#${base16Scheme.base00}";
      base01 = "#${base16Scheme.base01}";
      base02 = "#${base16Scheme.base00}";
      base03 = "#${base16Scheme.base03}";
      base04 = "#${base16Scheme.base04}";
      base05 = "#${base16Scheme.base05}";
      base06 = "#${base16Scheme.base06}";
      base07 = "#${base16Scheme.base07}";
      base08 = "#${base16Scheme.base08}";
      base09 = "#${base16Scheme.base09}";
      base0A = "#${base16Scheme.base0A}";
      base0B = "#${base16Scheme.base0B}";
      base0C = "#${base16Scheme.base0C}";
      base0D = "#${base16Scheme.base0D}";
      base0E = "#${base16Scheme.base0E}";
      base0F = "#${base16Scheme.base0F}";
    };
  };
  opts = {
    number = true;
    #relativenumber = true;
    signcolumn = "yes";
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    cursorline = true;
    ruler = true;
    scrolloff = 7;
    termguicolors = true;
    mouse = "a";
    fileencoding = "utf-8";
    swapfile = false;
    ignorecase = true;
    smartcase = true;
    wrap = false;
  };
  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
    providers.wl-copy.package = pkgs.wl-clipboard;
  };
}
