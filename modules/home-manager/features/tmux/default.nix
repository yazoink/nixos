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
      extraConfig = ''
        set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q

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


        # DESIGN TWEAKS

        # don't do anything when a 'bell' rings
        set -g visual-activity off
        set -g visual-bell off
        set -g visual-silence off
        setw -g monitor-activity off
        set -g bell-action none

        # clock mode
        setw -g clock-mode-colour yellow

        # copy mode
        setw -g mode-style 'fg=black bg=red bold'
        set -g pane-border-style 'fg=red'
        set -g pane-active-border-style 'fg=yellow'

        # statusbar
        set -g status-position bottom
        set -g status-justify left
        set -g status-style 'fg=red'

        set -g status-left \'\'
        set -g status-left-length 10

        set -g status-right-style 'fg=black bg=yellow'
        set -g status-right '%Y-%m-%d %H:%M '
        set -g status-right-length 50

        setw -g window-status-current-style 'fg=black bg=red'
        setw -g window-status-current-format ' #I #W #F '

        setw -g window-status-style 'fg=red bg=black'
        setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

        setw -g window-status-bell-style 'fg=yellow bg=red bold'

        # messages
        set -g message-style 'fg=yellow bg=red bold'
      '';
    };
  };
}
