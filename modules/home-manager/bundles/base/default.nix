{pkgs, osConfig, lib, ...}:
{
  imports = [
    ../../features/btop
    ../../features/garfetch
    ../../features/git
    ../../features/nixvim
    ../../features/pswdgen
    ../../features/shell-config
    ../../features/ssh-config
    ../../features/tmux
    ../../features/yazi
  ];

  config = lib.mkIf osConfig.myOptions.bundles.base.enable {
    bundles.base = builtins.trace "home-manager base features set" {
      btop.enable = true;
      garfetch.enable = true;
      git.enable = true;
      nixvim.enable = true;
      pswdgen.enable = true;
      shellConfig.enable = true;
      sshConfig.enable = true;
      tmux.enable = true;
      yazi.enable = true;
    };

    home.packages = with pkgs; [
      ### terminal utilities ###
      tldr
      jq
      fzf
      nix-index
      htop
      tree

      ### terminal eyecandy ###
      fastfetch
    ];
  };
}
