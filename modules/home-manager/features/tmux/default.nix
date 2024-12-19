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

        set-window-option -g window-status-style fg=brightblack,bg=default,dim
        set-window-option -g window-status-current-style fg=green,bg=default,bright
        set -g window-status-separator '#[fg=brightblack] | '

        set-option -g pane-border-style fg=black
        set-option -g pane-active-border-style fg=green

        set -g status-left ' #[fg=blue,bg=default]  #[fg=blue]#(check-ssh) '
        set -g status-right '#[fg=blue] #[fg=blue]#{b:pane_current_path} #[fg=magenta] #[fg=magenta,bg=default]%d.%a %H:%M:%S#[fg=cyan]#[push-default]#(bat_info=$(bat-stat); if [ -n "$bat_info" ]; then echo " $bat_info"; else echo " "; fi)#[fg=cyan] #S'
        set -g status-style bg=default,fg=default
        set -g status-left-length 40
        set -g status-right-length 80

        set-window-option -g window-status-format "#I:#W"

        set-option -g pane-border-style fg=brightblack
        set-option -g pane-active-border-style fg=green

        set -g status-interval 1 # Update status every second

        set -g message-style bg=default,fg=white

        set-window-option -g allow-rename on
        set-option -g set-titles off
        set-option -sa terminal-overrides ',xterm*:Tc'
        set-option -g renumber-windows on
      '';
    };
  };
}
