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
        stylix.iconTheme = {
          enable = true;
          dark = osConfig.desktopTheme.iconTheme.name;
          light = osConfig.desktopTheme.iconTheme.name;
          package = osConfig.desktopTheme.iconTheme.package;
        };
      }
      (import ./gtk {inherit config osConfig;})
      (import ./qt {inherit config pkgs osConfig;})
    ]
  );
}
