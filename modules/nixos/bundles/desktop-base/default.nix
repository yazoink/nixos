{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  inherit (config.myOptions.bundles) desktopBase;
in
  lib.mkIf desktopBase.enable (lib.mkMerge [
    {
      myOptions.bundles.base.enable = lib.mkForce true;
    }
    (import ./acpi {inherit config lib pkgs inputs pkgs-stable;})
    (import ./audio {inherit config lib pkgs inputs pkgs-stable;})
    (import ./dconf {inherit config lib pkgs inputs pkgs-stable;})
    (import ./file-managers {inherit config lib pkgs inputs pkgs-stable;})
    (import ./fonts {inherit config lib pkgs inputs pkgs-stable;})
    (import ./gnome-keyring {inherit config lib pkgs inputs pkgs-stable;})
    (lib.mkIf desktopBase.plymouth.enable
      (import ./plymouth {inherit config lib pkgs inputs pkgs-stable;}))
    (import ./polkit {inherit config lib pkgs inputs pkgs-stable;})
    (import ./rices {inherit config lib pkgs inputs pkgs-stable;})
    (lib.mkIf desktopBase.silent-boot.enable
      (import ./silent-boot {inherit config lib pkgs inputs pkgs-stable;}))
  ])
