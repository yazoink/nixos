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
  }
  (import ./gamemode {inherit config lib pkgs inputs pkgs-stable;})
  (import ./mpd {inherit config lib pkgs inputs pkgs-stable;})
  (import ./mullvad {inherit config lib pkgs inputs pkgs-stable;})
  (import ./printing {inherit config lib pkgs inputs pkgs-stable;})
])
