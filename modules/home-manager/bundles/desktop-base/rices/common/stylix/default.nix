# stylix theming
{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}: {
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
      (import ./zathura {inherit lib config pkgs osConfig;})
    ]
  );
}
