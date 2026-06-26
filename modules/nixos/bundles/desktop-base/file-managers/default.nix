{
  lib,
  pkgs,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in {
  imports = [(./. + "/${name}")];
}
