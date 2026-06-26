{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions) features;
in
  lib.mkMerge [
    (lib.mkIf features.calibre.enable
      (import ./calibre {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.expenses.enable
      (import ./expenses {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.lutgen.enable
      (import ./lutgen {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.obsidian.enable
      (import ./obsidian {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.virtManager.enable
      (import ./virt-manager {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.vscode.enable
      (import ./vscode {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.wine.enable
      (import ./wine {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf features.garfetch.enable
      (import ./wine {inherit osConfig config lib pkgs inputs;}))
  ]
