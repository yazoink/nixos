# window managers
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.bundles.desktopBase.desktop) windowManager;
in (import (./. + "/${windowManager.name}")
  {inherit osConfig config lib pkgs inputs windowManager;})
