{lib, ...}: {
  imports = [
    ./thunar
    ./pcmanfm
    ./nemo
  ];
  options = {
    defaultApps.fileManager.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
