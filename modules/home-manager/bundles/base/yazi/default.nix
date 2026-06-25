{...}: {
  programs.yazi = {
    enable = true;
    # package = pkgs-stable.yazi;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      mgr = {
        ratio = [1 2 2];
        sort_by = "natural";
        linemode = "size";
        show_symlink = true;
      };
    };
  };
}
