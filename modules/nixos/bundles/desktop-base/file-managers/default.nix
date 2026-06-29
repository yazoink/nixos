{
  pkgs,
  lib,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  (import ./. "/${name}")
  lib.mkMerge [
    (lib.mkIf (fileManager == "nemo")
      (import ./nemo {inherit pkgs;}))
    (lib.mkIf (fileManager == "pcmanfm")
      (import ./pcmanfm {inherit pkgs;}))
    (lib.mkIf (fileManager == "thunar")
      (import ./thunar {inherit pkgs;}))
  ]
