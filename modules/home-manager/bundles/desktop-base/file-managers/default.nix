{osConfig, ...}: let
  name = osConfig.myOptions.defaultApps.fileManager;
  makeCfg = name: desktopFile: {
    xdg.mimeApps.defaultApplications = {
      "inode/directory" = [desktopFile]; # Directories
    };
  };
  desktopFiles = {
    nemo = "nemo.desktop";
    pcmanfm = "pcmanfm.desktop";
    thunar = "thunar.desktop";
  };
in
  makeCfg name desktopFiles.${name}
