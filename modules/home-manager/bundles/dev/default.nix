{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig) myOptions;
  inherit (myOptions.bundles) dev;
in
  lib.mkIf dev.enable (lib.mkMerge [
    {
      home.packages = with pkgs; [
        texliveFull
        zig
        php
        cmake
        gcc
        gnumake
        clang-tools
        python3
        typst
      ];
    }
  ])
