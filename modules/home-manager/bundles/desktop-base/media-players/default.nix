# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.mediaPlayer) command;
in
  lib.mkMerge [
    # celluloid
    (lib.mkIf (command == "celluloid")
      (import ./celluloid {inherit osConfig config lib pkgs inputs;}))
    # mpv
    (lib.mkIf (command == "mpv")
      (import ./mpv {inherit osConfig config lib pkgs inputs;}))
    # vlc
    (lib.mkIf (command == "vlc")
      (import ./vlc {inherit osConfig config lib pkgs inputs;}))
  ]
