{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable (
    lib.mkMerge [
      {
        stylix.icons = {
          enable = true;
          dark = osConfig.desktopTheme.icons.name;
          light = osConfig.desktopTheme.icons.name;
          package = osConfig.desktopTheme.icons.package;
        };
      }
      (import ./gtk {inherit config osConfig;})
      (import ./qt {inherit config pkgs osConfig;})
    ]
  );
}
