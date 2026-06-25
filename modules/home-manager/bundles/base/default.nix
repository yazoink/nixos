{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkIf osConfig.myOptions.bundles.desktopBase.enable (lib.mkMerge [
  {
    home.packages = with pkgs; [
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
  }
  (import ./btop {inherit osConfig config lib pkgs inputs;})
  (import ./fastfetch {inherit osConfig config lib pkgs inputs;})
  (import ./garfetch {inherit osConfig config lib pkgs inputs;})
  (import ./git {inherit osConfig config lib pkgs inputs;})
  (import ./nixvim {inherit osConfig config lib pkgs inputs;})
  # (import ./pswdgen {inherit osConfig config lib pkgs inputs;})
  (import ./pswdrs {inherit osConfig config lib pkgs inputs;})
  (import ./shell-config {inherit osConfig config lib pkgs inputs;})
  (import ./ssh {inherit osConfig config lib pkgs inputs;})
  (import ./tmux {inherit osConfig config lib pkgs inputs;})
  (import ./yazi {inherit osConfig config lib pkgs inputs;})
])
