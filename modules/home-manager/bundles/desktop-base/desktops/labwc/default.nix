# labwc configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  windowManager,
  ...
}: let
  inherit (windowManager.labwc) style;
in (import (./. + "/${style}") {inherit osConfig config lib pkgs inputs;})
