{
  config,
  lib,
  pkgs,
  ...
}: {
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
    prettypst
    # php84Packages.php-codesniffer
  ];
  programs.nixvim = lib.mkMerge [
    {enable = true;}
    (import ./config {inherit lib config pkgs;})
  ];
}
