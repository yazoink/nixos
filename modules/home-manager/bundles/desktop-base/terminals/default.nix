{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = config.myOptions.defaultApps.terminal;
in
  import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;}
