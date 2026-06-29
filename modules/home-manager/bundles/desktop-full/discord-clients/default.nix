{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  ...
}: let
  name = defaultApps.discordClient;
in
  import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;}
