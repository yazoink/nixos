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
    home.packages = with pkgs; [keepassxc];
  }
  (import ./dconf {inherit osConfig config lib pkgs inputs;})
  (import ./direnv {inherit osConfig config lib pkgs inputs;})
  (import ./document-readers {inherit osConfig config lib pkgs inputs;})
  (import ./file-managers {inherit osConfig config lib pkgs inputs;})
  (import ./gui-text-editors {inherit osConfig config lib pkgs inputs;})
  (import ./image-viewers {inherit osConfig config lib pkgs inputs;})
  (import ./media-players {inherit osConfig config lib pkgs inputs;})
  (import ./rices {inherit osConfig config lib pkgs inputs;})
  (import ./terminals {inherit osConfig config lib pkgs inputs;})
  (import ./web-browsers {inherit osConfig config lib pkgs inputs;})
  (import ./xdg {inherit osConfig config lib pkgs inputs;})
])
