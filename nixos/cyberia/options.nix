{config, ...}: {
  myOptions = {
    userAccount.username = "gene";
    defaultApps = {
      # fileManager = {
      #   command = "thunar";
      # };
      terminal = {
        command = "kitty";
      };
      discordClient = {
        command = "legcord";
      };
    };
    desktopTheme = {
      name = "moonfly";
      fonts.terminal = {
        name = "Iosevka Nerd Font";
        # name = "SFMono";
        # name = "Bm437 NEC APC3 8x16";
        # name = "Terminus";
        size = 12;
      };
      fonts.desktop = {
        # name = "SF Pro Display";
        name = "Rubik";
        size = 11;
      };
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/abstract1.jpg;
        };
        color = {
          hex = config.stylix.base16Scheme.base03;
        };
      };
      sddm = {
        scale = 1.3;
        # wallpaper = ../../wallpapers/catppuccin/galaxy-waves.jpg;
        wallpaper = ../../wallpapers/flower.jpg;
      };
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.displayManager = "sddm";
      desktopBase.windowManager = "hyprland";
      desktopFull.enable = true;
    };
    features = {
      virtManager.enable = true;
      virtualbox.enable = true;
      spaceCadetPinball.enable = true;
      prismlauncher.enable = true;
      lutgen.enable = true;
    };
    hardwareFeatures = {
      diskBurner.enable = true;
      ssd.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.2;
      };
    };
  };
}
