# hyprland configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  windowManager,
  ...
}: let
  inherit (windowManager.hyprland) style;
in (import (./. + "/${style}") {inherit osConfig config lib pkgs inputs;})
