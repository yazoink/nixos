{
  pkgs,
  lib,
  defaultApps,
  ...
}: let
  inherit (defaultApps) fileManager;
in
  lib.mkMerge [
    (lib.mkIf (fileManager == "nemo")
      (import ./nemo {inherit pkgs;}))
    (lib.mkIf (fileManager == "pcmanfm")
      (import ./pcmanfm {inherit pkgs;}))
    (lib.mkIf (fileManager == "thunar")
      (import ./thunar {inherit pkgs;}))
  ]
