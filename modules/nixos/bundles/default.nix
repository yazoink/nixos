{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  inherit (config.myOptions) bundles;
  fileManager = config.myOptions.defaultApps.fileManager;
in
  lib.mkMerge [
    (lib.mkIf bundles.base.enable
      (import ./base {inherit config lib pkgs inputs pkgs-stable;}))

    (lib.mkIf bundles.desktopBase.enable (lib.mkMerge [
      {bundles.base.enable = true;}
      (import ./desktop-base {inherit fileManager config lib pkgs inputs pkgs-stable;})
    ]))

    (lib.mkIf bundles.desktopFull.enable (lib.mkMerge [
      {bundles.desktopBase.enable = true;}
      (import ./desktop-full {inherit config lib pkgs inputs pkgs-stable;})
    ]))
  ]
