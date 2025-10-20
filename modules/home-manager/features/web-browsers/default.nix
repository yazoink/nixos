{lib, ...}: {
  imports = [
    ./firefox
    ./brave
    ./librewolf
  ];
  options = {
    defaultApps.webBrowser.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
