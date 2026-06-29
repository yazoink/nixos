{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  ...
}: let
  name = defaultApps.terminal;
  inherit (osConfig.myOptions.bundles.desktopBase.desktop) terminalPadding;
in
  import (./. + "/${name}") {inherit osConfig config lib pkgs inputs terminalPadding;}
