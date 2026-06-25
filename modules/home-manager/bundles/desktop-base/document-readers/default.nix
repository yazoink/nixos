# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.documentReader) command;
in
  lib.mkMerge [
    # atril
    (lib.mkIf (command == "atril")
      (import ./atril {inherit osConfig config lib pkgs inputs;}))
    #zathura
    (lib.mkIf (command == "zathura")
      (import ./zathura {inherit osConfig config lib pkgs inputs;}))
  ]
