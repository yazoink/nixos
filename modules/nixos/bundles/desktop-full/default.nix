{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}:
lib.mkMerge [
  (import ./gamemode {inherit config lib pkgs inputs pkgs-stable;})
  (import ./mpd {inherit config lib pkgs inputs pkgs-stable;})
  (import ./mullvad {inherit config lib pkgs inputs pkgs-stable;})
  (import ./printing {inherit config lib pkgs inputs pkgs-stable;})
]
