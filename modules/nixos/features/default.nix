{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions) features hardwareFeatures;
in
  lib.mkMerge [
    (lib.mkIf features.silentBoot.enable
      (import ./silent-boot {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf features.plymouth.enable
      (import ./plymouth {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf features.retroarch.enable
      (import ./retroarch {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf features.steam.enable
      (import ./steam {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf features.virtManager.enable
      (import ./virt-manager {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf features.virtualbox.enable
      (import ./virtualbox {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf hardwareFeatures.bluetooth.enable
      (import ./bluetooth {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf hardwareFeatures.diskBurner.enable
      (import ./disk-burner {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf hardwareFeatures.opentabletdriver.enable
      (import ./opentabletdriver {inherit pkgs-stable config lib pkgs inputs;}))

    (lib.mkIf hardwareFeatures.ssd.enable
      (import ./ssd {inherit pkgs-stable config lib pkgs inputs;}))
  ]
