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
    stylix.targets.nixvim = lib.mkIf (config.stylix.polarity == "dark") {
      enable = true;
    };
    home.packages = with pkgs; [
      fzf
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
      racket
      # php84Packages.php-codesniffer
    ];
    programs.nixvim = lib.mkMerge [
      {enable = true;}
      (import ./config {inherit lib config pkgs;})
    ];
  };
}
