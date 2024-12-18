{config, lib, pkgs, ...}:
let
  myAliases = {
    "rebuild-test" = "${rebuild}/bin/rebuild -t";
    "update" = "cd ~/nixos && sudo nix flake update";
    "optimise" = "sudo nix-store --optimise && nix-store --optimise";
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
    "vpssh" = "tmux && ssh vps";
    "ga" = "git add";
    "gaa" = "git add .";
    "gc" = "git commit";
    "gcm" = "git commit -m";
    "gps" = "git push";
    "gpl" = "git pull";
    "php-dev" = "nix shell github:loophp/nix-shell#php82 --impure";
    "music" = "ncmpcpp";
    "mu-dl" = "yt-dlp -x -f best --audio-format flac";
    "search" = "nix --extra-experimental-features \"nix-command flakes\" search nixpkgs";
    "diskspace" = "sudo df -h | grep -E \"sd|lv|Size\" | sort";
  };
  rebuild = pkgs.callPackage ./scripts/rebuild {};
  clean = pkgs.callPackage ./scripts/clean {};
  ascii = pkgs.callPackage ./scripts/ascii {};
  nsfind = pkgs.callPackage ./scripts/nsfind {};
  dict = pkgs.callPackage ./scripts/dict {};
  audtousd = pkgs.callPackage ./scripts/audtousd {};
in
{
  options = {
    bundles.base.shellConfig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.base.shellConfig.enable {
    home.packages = [rebuild clean ascii nsfind dict audtousd];
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

      initExtra = ''
        PROMPT="%F{blue}>%f%F{red}>%f%F{yellow}>%f "
      '';

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
