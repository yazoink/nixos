{
  treesitter = {
    enable = true;
    nixvimInjections = true;
    folding.enable = false;
    nixGrammars = true;
    settings = {
      ensure_installed = "all";
      highlight.enable = true;
      incremental_selection.enable = true;
      indent.enable = true;
    };
  };

  # treesitter-refactor = {
  #   enable = true;
  # };
}
