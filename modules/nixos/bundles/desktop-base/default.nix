{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  fileManager,
  ...
}:
lib.mkMerge [
  (import ./acpi {inherit config lib pkgs inputs pkgs-stable;})
  (import ./audio {inherit config lib pkgs inputs pkgs-stable;})
  (import ./dconf {inherit config lib pkgs inputs pkgs-stable;})
  (import ./fonts {inherit config lib pkgs inputs pkgs-stable;})
  (import ./gnome-keyring {inherit config lib pkgs inputs pkgs-stable;})
  (import ./polkit {inherit config lib pkgs inputs pkgs-stable;})
  (import ./desktops {inherit config lib pkgs inputs pkgs-stable;})
  (import ./file-managers {inherit pkgs fileManager;})
]
