# window managers
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  desktop,
  ...
}: let
  inherit (desktop) windowManager;
in (import (./. + "/${windowManager.name}")
  {inherit osConfig config lib pkgs inputs windowManager;})
