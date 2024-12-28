{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeManagerModules.nixcord
    ./cyberia
    ./fluoride
    ./stardust
    ../modules/home-manager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.home-manager.enable = builtins.trace "home-manager enabled" true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
