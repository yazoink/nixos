{config, lib, pkgs, osConfig, ...}:
let
  myAliases = {
    #"rebuild" = "sudo nixos-rebuild switch --flake ~/nixos#$(hostname) && notify-send 'Rebuild complete!'";
    #"rebuild-test" = "sudo nixos-rebuild test --flake ~/nixos#$(hostname) && notify-send 'Test rebuild complete!";
    "update" = "cd ~/nixos && sudo nix flake update";
    "clean" = "sudo nix-store --gc && nix-store --gc && sudo nix-collect-garbage -d && nix-collect-garbage -d";
    "optimise" = "sudo nix-store --optimise && nix-store --optimise";
    "firefox-edit" = "nvim ~/nixos/modules/home-manager/applications/firefox/default.nix";
    "chx" = "chmod u+x";
    "cp" = "cp -v";
    "rm" = "rm -v";
    "mkd" = "mkdir -pv";
    "nixos" = "cd ~/nixos";
    "ff" = "fastfetch";
    #"ls" = "ls -hN --color=auto";
    "ls" = "eza";
    "grep" = "grep --color=auto";
    "diff" = "diff --color=auto";
    "ip" = "ip -color=auto";
    "vim" = "nvim";
    "make" = "make -j$(nproc)";
    "vpssh" = "ssh vps";
    "ga" = "git add";
    "gaa" = "git add .";
    "gc" = "git commit";
    "gcm" = "git commit -m";
    "gps" = "git push";
    "gpl" = "git pull";
    "php-dev" = "nix shell github:loophp/nix-shell#php82 --impure";
    "music" = "ncmpcpp";
  };
in
{
  options = {
    bundles.base.shellConfig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.base.shellConfig.enable {
    home.sessionPath = [
      "/home/${osConfig.myOptions.userAccount.username}/.local/bin"
    ];
    home.file = {
      ".local/bin/rebuild".source = ./scripts/rebuild;
      ".local/bin/rebuild-test".source = ./scripts/rebuild-test;
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      history.ignoreDups = true;
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "copyfile"
          "copypath"
          "colorize"
          "colored-man-pages"
        ];
      };

      shellAliases = myAliases;
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
      #icons = "auto";
      git = true;
    };
  };
}
