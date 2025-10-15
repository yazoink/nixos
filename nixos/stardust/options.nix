{config, ...}: {
  myOptions = {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      terminal = {
        command = "alacritty";
      };
      mediaPlayer.command = "mpv";
      documentReader.command = "zathura";
    };
    userAccount.username = "gene";
    desktopTheme = {
      name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/flowers-1.jpg;
        };
      };
      fonts = {
        desktop = {
          name = "Rubik";
          size = 11;
        };
        terminal = {
          # name = "Bm437 NEC APC3 8x16";
          name = "ZedMono Nerd Font";
          size = 12;
        };
      };
      sddm = {
        scale = 1.4;
        wallpaper = ../../wallpapers/flowers-1.jpg;
        #wallpaper = ./wallpapers/clouds-levuaska.jpg;
      };
    };
    bundles = {
      base.starshipFormat = 1;
      desktopBase.windowManager = "hyprland";
      desktopBase.displayManager = "sddm";
      desktopBase.mpv.profile = "fast";
      desktopBase.plymouth.enable = true;
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
    };
    hardwareFeatures = {
      bootloader.type = "uefi";
      ssd.enable = true;
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
