{config, ...}: {
  myOptions = {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      webBrowser.command = "zen";
      terminal = {
        command = "footclient";
      };
      mediaPlayer.command = "mpv";
      documentReader.command = "zathura";
    };
    userAccount.username = "gene";
    desktopTheme = {
      rice.interzone.enable = true;
      colorscheme = "caroline";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          # path = ../../wallpapers/flowers-1.jpg;
          path = ../../wallpapers/wall1.jpg;
        };
      };
      fonts = {
        desktop = {
          name = "Gabarito";
          size = 12;
        };
        terminal = {
          name = "Monocraft";
          # name = "Aporetic Serif Mono";
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
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
    };
    features = {
      # minetest.enable = true;
      # pychess.enable = true;
      # knavalbattle.enable = true;
      gzdoom.enable = true;
      eduke32.enable = true;
      prismlauncher.enable = true;
      superTuxKart.enable = true;
      virtManager.enable = true;
      virtualbox.enable = true;
      expenses.enable = true;
      krita.enable = true;
      calibre.enable = true;
      obsidian.enable = true;
    };
    hardwareFeatures = {
      bootloader.type = "uefi";
      ssd.enable = true;
      bluetooth.enable = true;
      # diskBurner.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.3;
        batteryName = "BAT1";
      };
    };
  };
}
