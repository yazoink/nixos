# fully featured desktop
{
  config,
  lib,
  ...
}: {
  imports = [
    ./gamemode
    ./mpd
    ./mullvad
    ./printing
  ];

  config = lib.mkIf config.myOptions.bundles.desktopFull.enable {
    myOptions.bundles.desktopBase.enable = true;
    bundles.desktopFull = {
      gamemode.enable = true;
      mpd.enable = true;
      mullvad.enable = true;
      printing.enable = true;
    };
  };
}
