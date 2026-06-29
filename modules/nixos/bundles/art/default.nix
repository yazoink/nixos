{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}:
lib.mkIf config.myOptions.bundles.desktopFull.enable (lib.mkMerge [
  {
    myOptions.bundles.desktopBase.enable = lib.mkForce true;
    myOptions.hardware-features.opentabletdriver.enable = lib.mkForce true;
  }
])
