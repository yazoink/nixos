{config, ...}: {
  myOptions = builtins.trace "options set" {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      fileManager = {
        command = "nemo";
      };
      guiTextEditor = {
        command = "pluma";
      };
      documentReader = {
        command = "zathura";
      };
      mediaPlayer = {
        command = "mpv";
      };
      imageViewer = {
        command = "imv";
      };
      terminal = {
        command = "footclient";
      };
      webBrowser = {
        command = "zen";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      name = "biscuit-de-mar-light";
      # name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/biscuit-de-mar/peter-bucks-hY4TcvzyPlw-unsplash_current.png;
        };
      };
      windowGaps = {
        inner = 10;
        outer = 15;
      };
      terminalPadding = 24;
      fonts.desktop = {
        # name = "SF Pro Display";
        # name = "Rubik";
        # size = 11;
      };
      fonts.terminal = {
        # name = "Iosevka Nerd Font";
        # name = "Bm437 NEC APC3 8x16";
        # size = 12;
      };
      sddm = {
        scale = 0.8;
        wallpaper = ../../wallpapers/biscuit-de-mar/peter-bucks-hY4TcvzyPlw-unsplash_current.png;
      };
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.windowManager = "hyprland";
      desktopBase.displayManager = "none";
      desktopBase.plymouth.enable = false;
      desktopFull.enable = true;
    };
    features = {
      # etterna.enable = true;
      prismlauncher.enable = true;
      osu.enable = true;
      # ollama.enable = true;
      steam.enable = true;
      gamescope.enable = true;
      virtManager.enable = true;
      lutgen.enable = true;
      krita.enable = true;
    };
    hardwareFeatures = {
      bootloader = {
        type = "uefi";
      };
      ssd.enable = true;
    };
  };
}
