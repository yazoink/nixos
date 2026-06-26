{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  desktopBase = config.myOptions.bundles.desktopBase;
  fileManager = "${config.myOptions.defaultApps.fileManager}";
in
  lib.mkIf desktopBase.enable (lib.mkMerge [
    {
      myOptions.bundles.base.enable = builtins.trace "${config.myOptions.defaultApps.fileManager}" lib.mkForce true;
    }
    (import ./acpi {inherit config lib pkgs inputs pkgs-stable;})
    (import ./audio {inherit config lib pkgs inputs pkgs-stable;})
    (import ./dconf {inherit config lib pkgs inputs pkgs-stable;})
    (import ./file-managers {inherit lib pkgs inputs pkgs-stable fileManager;})
    (import ./fonts {inherit config lib pkgs inputs pkgs-stable;})
    (import ./gnome-keyring {inherit config lib pkgs inputs pkgs-stable;})
    (import ./polkit {inherit config lib pkgs inputs pkgs-stable;})
    (import ./desktops {inherit config lib pkgs inputs pkgs-stable;})
  ])
