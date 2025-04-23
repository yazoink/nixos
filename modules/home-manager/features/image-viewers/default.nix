{lib, ...}: {
  imports = [
    ./ristretto
    ./imv
  ];
  options = {
    defaultApps.imageViewer.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
