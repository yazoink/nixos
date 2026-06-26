{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.defaultApps) discordClient;
in
  import (./. + "/${discordClient}") {inherit pkgs-stable config lib pkgs inputs;}
