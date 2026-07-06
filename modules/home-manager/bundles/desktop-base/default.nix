{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig) myOptions;
  inherit (myOptions) defaultApps;
  inherit (myOptions.bundles) desktopBase;
in
  lib.mkIf desktopBase.enable (lib.mkMerge [
    {
      home.packages = with pkgs; [
        keepassxc
      ];
    }
    (import ./dconf {inherit osConfig config lib pkgs inputs;})
    (import ./direnv {inherit osConfig config lib pkgs inputs;})
    (import ./document-readers {inherit osConfig config lib pkgs inputs defaultApps;})
    (import ./file-managers {inherit osConfig config lib pkgs inputs defaultApps;})
    (import ./gui-text-editors {inherit osConfig config lib pkgs inputs defaultApps;})
    (import ./image-viewers {inherit osConfig config lib pkgs inputs defaultApps;})
    (import ./media-players {
      inherit osConfig config lib pkgs inputs defaultApps;
      inherit (desktopBase) mpv;
    })
    (import ./desktops {
      inherit osConfig config lib pkgs inputs;
      inherit (desktopBase) desktop;
    })
    (import ./terminals {inherit osConfig config lib pkgs inputs defaultApps;})
    (import ./web-browsers {
      inherit osConfig config lib pkgs inputs defaultApps;
      inherit (desktopBase) zenBrowser;
    })
    (import ./xdg {inherit osConfig config lib pkgs inputs;})
  ])
