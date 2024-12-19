{config, lib, ...}:
{
  options = {
    bundles.base.tmux.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";
      clock24 = false;
      extraConfig = ''
        # remap prefix from 'C-b' to 'C-a'
        unbind C-b
        set-option -g prefix C-a

        # split panes using | and -
        bind | split-window -h
        bind - split-window -v
        unbind '"'
        unbind %

        switch panes using Alt-arrow without prefix
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        # Enable mouse control (clickable windows, panes, resizable panes)
        set -g mouse on

        set -g pane-border-style fg=default
        set -g pane-active-border-style fg=default
      '';
    };
  };
}
