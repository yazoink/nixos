{pkgs, ...}: {
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
