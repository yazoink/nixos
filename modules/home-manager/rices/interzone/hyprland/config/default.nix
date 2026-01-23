{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}:
lib.mkMerge [
  {
    settings = lib.mkMerge [
      (import ./keybinds {inherit config lib osConfig;})
      (import ./autostart.nix {inherit osConfig;})
      (import ./animations.nix)
      (import ./env_vars.nix {inherit osConfig;})
      (import ./window_rules.nix)
      (import ./general.nix {inherit config osConfig;})
      (import ./hardware.nix {inherit lib osConfig;})
      (import ./vars.nix {inherit config osConfig;})
    ];
  }
  # (import ./plugins {
  #   inherit lib pkgs config osConfig inputs;
  # })
]
