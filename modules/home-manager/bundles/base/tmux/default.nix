{...}: {
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    clock24 = false;
  };
}
