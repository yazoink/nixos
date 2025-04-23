{lib, ...}: {
  imports = [
    ./ristretto
  ];
  options = {
    defaultApps.imageViewer.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
