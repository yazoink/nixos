# fully featured desktop
{
  config,
  lib,
  ...
}: {
  imports = [
    ./gamemode
    # ./kdeconnect
    ./mpd
    ./mullvad
    ./printing
    # ./syncthing
  ];

  config = lib.mkIf config.myOptions.bundles.desktopFull.enable {
    myOptions.bundles.desktopBase.enable = true;
    bundles.desktopFull = {
      gamemode.enable = true;
      # kdeconnect.enable = true; # didn't work
      mpd.enable = true;
      mullvad.enable = true;
      printing.enable = true;
      # syncthing.enable = true;
    };
  };
}
