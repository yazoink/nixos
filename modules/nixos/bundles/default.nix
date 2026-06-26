{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  inherit (config.myOptions) bundles;
in
  lib.mkMerge [
    (lib.mkIf bundles.base.enable
      (import ./base {inherit config lib pkgs inputs pkgs-stable;}))

    (lib.mkIf bundles.desktopBase.enable (lib.mkMerge [
      (import ./base {inherit config lib pkgs inputs pkgs-stable;})
      (import ./desktop-base {inherit config lib pkgs inputs pkgs-stable;})
    ]))

    (lib.mkIf bundles.desktopFull.enable (lib.mkMerge [
      (import ./desktop-base {inherit config lib pkgs inputs pkgs-stable;})
      (import ./desktop-full {inherit config lib pkgs inputs pkgs-stable;})
    ]))
  ]
