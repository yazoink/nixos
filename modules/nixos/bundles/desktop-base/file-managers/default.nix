{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.defaultApps.fileManager) command;
in
  lib.mkMerge [
    (lib.mkIf (command == "nemo")
      (import ./nemo {inherit config lib pkgs inputs;}))

    (lib.mkIf (command == "pcmanfm")
      (import ./pcmanfm {inherit config lib pkgs inputs;}))

    (lib.mkIf (command == "thunar")
      (import ./thunar {inherit config lib pkgs inputs;}))
  ]
