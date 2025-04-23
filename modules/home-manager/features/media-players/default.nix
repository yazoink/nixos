{lib, ...}: {
  imports = [
    ./vlc
  ];
  options = {
    defaultApps.mediaPlayer.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
