{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  imports = [
    ../../features/btop
    ../../features/garfetch
    ../../features/git
    ../../features/nixvim
    ../../features/pswdgen
    ../../features/pswdrs
    ../../features/shell-config
    ../../features/ssh
    ../../features/tmux
    ../../features/yazi
    ../../features/fastfetch
  ];

  config = lib.mkIf osConfig.myOptions.bundles.base.enable {
    bundles.base = builtins.trace "home-manager base features set" {
      btop.enable = true;
      garfetch.enable = true;
      git.enable = true;
      nixvim.enable = true;
      pswdgen.enable = false;
      pswdrs.enable = true;
      shellConfig.enable = true;
      tmux.enable = true;
      yazi.enable = true;
      fastfetch.enable = true;
    };

    home.packages = with pkgs; [
      ### terminal utilities ###
      # tldr
      jq
      fzf
      # nix-index
      htop
      alejandra
      tree
      s-tui
      stress
    ];

    xdg.configFile."nixpkgs/config.nix".text = ''
      {
        allowUnfree = true;
      }
    '';
  };
}
