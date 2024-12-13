{config, lib, ...}:
{
  options = {
    bundles.base.nixvim.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports = [
    ./colors.nix
    ./keymaps.nix
    ./plugins.nix
  ];

  config = lib.mkIf config.bundles.base.nixvim.enable {
    programs.nixvim = {
      enable = true;
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
        scrolloff = 15;
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
      };
    };
  };
}
