{
  config,
  pkgs,
  ...
}: {
  myOptions = {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      webBrowser.command = "zen-twilight";
      terminal = {
        # command = "urxvt";
        command = "footclient";
      };
      mediaPlayer.command = "mpv";
      documentReader.command = "zathura";
      fileManager.command = "thunar";
    };
    userAccount.username = "gene";
    desktopTheme = {
      rice.openbox.enable = false;
      rice.labwc-glass.enable = false;
      rice.labwc-flat.enable = true;
      rice.hyprland-flat.enable = false;
      # zenBrowserShowBorders = false;
      colorscheme = "moonfly";
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
      windowGaps = {
        inner = 5;
        outer = 10;
      };
      fonts = {
        desktop = {
          name = "Gabarito";
          size = 11;
        };
        terminal = {
          name = "Aporetic Serif Mono";
          # name = "Terminess Nerd Font";
          size = 12;
        };
      };
    };
    bundles = {
      # base.starshipFormat = 1;
      base.starshipFormat = 2;
      desktopBase.silentBoot.enable = true;
      desktopBase.mpv.profile = "fast";
      desktopBase.plymouth.enable = false;
      # desktopBase.enable = true;
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
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
        hyprlandTouchpadScrollFactor = 0.15;
        labwcTouchpadScrollFactor = 0.15;
        batteryName = "BAT0";
      };
    };
  };
}
