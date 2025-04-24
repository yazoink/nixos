{
  config,
  lib,
  ...
}: {
  imports = [
    ../../features/adb
    ../../features/gamemode
    ../../features/kdeconnect
    ../../features/mpd
    ../../features/mullvad
    ../../features/printing
    # ../../features/syncthing
  ];

  config = lib.mkIf config.myOptions.bundles.desktopFull.enable {
    myOptions.bundles.desktopBase.enable = true;
    bundles.desktopFull = {
      # adb.enable = true;
      gamemode.enable = true;
      # kdeconnect.enable = true; # didn't work
      mpd.enable = true;
      mullvad.enable = true;
      printing.enable = true;
      # syncthing.enable = true;
    };
  };
}
