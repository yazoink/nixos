{
  lib,
  pkgs,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  import builtins.trace "${config.myOptions.defaultApps.fileManager}" (./. + "/${name}") {inherit lib pkgs;}
