{
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.wine.enable {
    home.packages = with pkgs;
      [winetricks]
      ++ (
        if osConfig.myOptions.bundles.desktopBase.windowManager == "awesome"
        then [pkgs.wineWowPackages.full]
        else [pkgs.wineWowPackages.waylandFull]
      );
  };
}
