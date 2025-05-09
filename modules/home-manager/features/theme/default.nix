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
          dark = osConfig.desktopTheme.iconTheme.name or "Numix";
          light = osConfig.desktopTheme.iconTheme.name or "Numix";
          package = osConfig.desktopTheme.iconTheme.package or pkgs.numix-icon-theme;
        };
      }
      (import ./gtk {inherit config;})
      (import ./qt {inherit config pkgs;})
    ]
  );
}
