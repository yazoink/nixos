# stylix theming
{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (osConfig.myOptions) bundles defaultApps;
in {
  config = lib.mkIf osConfig.desktopTheme.stylix.enable (
    lib.mkMerge [
      {
        stylix.icons = {
          enable = true;
          dark = osConfig.desktopTheme.stylix.icons.name;
          light = osConfig.desktopTheme.stylix.icons.name;
          package = osConfig.desktopTheme.stylix.icons.package;
        };
      }
      (import ./gtk {inherit config osConfig;})
      (import ./qt {inherit config pkgs osConfig;})

      (import ./imv {inherit config pkgs osConfig;})
      (import ./kitty {inherit config pkgs osConfig;})
      (import ./firefox {inherit config pkgs osConfig;})
    ]
  );
}
