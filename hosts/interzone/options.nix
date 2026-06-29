{
  config,
  pkgs,
  ...
}: {
  myOptions = {
    defaultApps = {
      discordClient = "vesktop";
      webBrowser = "zen-twilight";
      terminal = "foot";
      mediaPlayer = "mpv";
      documentReader = "zathura";
      fileManager = "thunar";
    };
    userAccount.username = "gene";
    bundles = {
      # base.starshipFormat = 1;
      base.starshipFormat = 2;
      desktopBase = {
        mpv.profile = "fast";
        desktop = {
          windowManager = {
            name = "labwc";
            labwc = {
              style = "flat";
            };
          };
          colorscheme = "moonfly";
          fonts.desktop = {
            name = "gabarito";
            size = 11;
          };
          fonts.terminal = {
            name = "aporetic-serif-mono";
            size = 12;
          };
          wallpaper = {
            type = "color";
            color.hex = "696969";
            image = {
              fillType = "fill";
              path = pkgs.fetchurl {
                url = "https://github.com/yazoink/wallpapers/blob/main/trees-and-leaves/wall1.jpg?raw=true";
                hash = "sha256-H8Hsm73MPbqrKl4RUiAhKUlkXPSntyghB95PpTmkuKM=";
              };
            };
          };
        };
      };
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
      art.enable = true;
      dev.enable = true;
    };
    features = {
      virtManager.enable = true;
      # virtualbox.enable = true;
      # expenses.enable = true;
      calibre.enable = true;
      # obsidian.enable = true;
      lutgen.enable = true;
    };
    hardwareFeatures = {
      bootloader.type = "legacy";
      ssd.enable = true;
      bluetooth.enable = true;
      # diskBurner.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        touchpadScrollFactor = 0.15;
        batteryName = "BAT0";
      };
    };
  };
}
