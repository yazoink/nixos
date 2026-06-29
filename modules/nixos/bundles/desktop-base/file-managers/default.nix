{
  pkgs,
  lib,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in (import ./. "/${name}")
