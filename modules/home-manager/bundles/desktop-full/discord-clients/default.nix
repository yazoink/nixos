{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  vesktop,
  ...
}: let
  name = defaultApps.discordClient;
in
  import (./. + "/${name}") {inherit osConfig config lib pkgs inputs vesktop;}
