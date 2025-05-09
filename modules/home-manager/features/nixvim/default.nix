{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    bundles.base.nixvim.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.nixvim.enable {
    stylix.targets.nixvim = {
      enable = lib.mkDefault true;
      # plugin = "base16-nvim";
      plugin =
        if (config.stylix.polarity == "dark")
        then "base16-nvim"
        else "mini.base16";
    };
    home.packages = with pkgs; [
      prettierd
      black
      stylua
      alejandra
      shfmt
      beautysh
      yamllint
      yamlfmt
      uncrustify
      fixjson
      rustfmt
      gcc
      clang-tools
      # php84Packages.php-cs-fixer broken :(
    ];
    programs.nixvim = lib.mkMerge [
      {enable = true;}
      (import ./config {inherit lib config;})
    ];
  };
}
