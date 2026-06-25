{...}: {
  programs.calibre = {
    enable = builtins.trace "calibre" true;
    # plugins = with pkgs; [];
  };
}
