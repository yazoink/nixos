{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = osConfig.myOptions.defaultApps.discordClient;
in
  import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;}
