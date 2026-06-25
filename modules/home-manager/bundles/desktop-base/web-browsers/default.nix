# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.webBrowser) command;
in
  lib.mkMerge [
    (lib.mkIf (command == "brave")
      (import ./brave {inherit osConfig config lib pkgs inputs;}))

    (lib.mkIf (command == "firefox")
      (import ./firefox {inherit osConfig config lib pkgs inputs;}))

    (lib.mkIf (command == "librewolf")
      (import ./librewolf {inherit osConfig config lib pkgs inputs;}))

    (lib.mkIf (command == "zen-twilight")
      (import ./zen {inherit osConfig config lib pkgs inputs;}))
  ]
