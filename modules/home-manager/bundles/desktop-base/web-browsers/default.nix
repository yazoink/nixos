{lib, ...}: {
  imports = [
    ./firefox
    ./brave
    ./librewolf
    ./zen
  ];
  options = {
    defaultApps.webBrowser.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
