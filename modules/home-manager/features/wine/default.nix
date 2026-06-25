{pkgs, ...}: {
  home.packages =
    with pkgs; [winetricks pkgs.wineWowPackages.waylandFull]
    /*
      ++ (
      if osConfig.myOptions.bundles.desktopBase.windowManager == "awesome"
      then [pkgs.wineWowPackages.full]
      else [pkgs.wineWowPackages.waylandFull]
    )
    */
    ;
}
