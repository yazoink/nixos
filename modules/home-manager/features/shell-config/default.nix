{
  config,
  lib,
  pkgs,
  ...
}: let
  myAliases = {
    "optimise" = "sudo nix-store --optimise && nix-store --optimise";
    "chx" = "chmod u+x";
    "cp" = "cp -v";
    "rm" = "rm -v";
    "mkd" = "mkdir -pv";
    "nixos" = "cd ~/nixos";
    "ff" = "fastfetch";
    #"ls" = "ls -hN --color=auto";
    "ls" = "eza -l -T -L=1";
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
    "mu-dl" = "yt-dlp -x --audio-format flac";
    "search" = "nix --extra-experimental-features \"nix-command flakes\" search nixpkgs";
    "diskspace" = "sudo df -h | grep -E \"sd|lv|Size\" | sort";
    "weather" = "curl wttr.in/Melbourne";
    "copypath" = "wl-copy \"$(pwd)\"";
    "solitaire" = "ttysolitaire --no-background-color --passes 420";
  };
  scripts = pkgs.callPackage ./scripts.nix {};
in {
  options = {
    bundles.base.shellConfig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports = [
    ./starship-formats
  ];

  config = lib.mkIf config.bundles.base.shellConfig.enable {
    home.packages = [scripts];
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

      initContent = ''
        #PROMPT="%F{blue}>%f%F{red}>%f%F{yellow}>%f "
        #eval "$(starship init zsh)"
      '';

      /*
        oh-my-zsh = {
        enable = true;
        #theme = "robbyrussell";
        plugins = [
          "copyfile"
          "copypath"
          "colorize"
          "colored-man-pages"
        ];
      };
      */

      shellAliases = myAliases;
    };

    programs = {
      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = true;
          command_timeout = 2500;
          directory = {
            read_only = " ";
            home_symbol = "~";
            format = " [$path]($style)[$read_only]($read_only_style) ";
            truncation_length = 8;
            truncation_symbol = "./";
            truncate_to_repo = true;
          };
          nix_shell = {
            symbol = " ";
          };
        };
      };

      eza = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = false;
        icons = "never";
        git = true;
      };
    };
  };
}
