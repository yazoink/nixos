{config, ...}: {
  myOptions = builtins.trace "options set" {
    defaultApps = {
      discordClient = {
        command = "legcord";
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
        command = "alacritty";
      };
      webBrowser = {
        command = "firefox";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      name = "biscuit-de-mar-dark";
      wallpaper = {
        type = "image";
        image = {
          path = ../../wallpapers/BouquetOnOliveGreen-darker.jpg;
          fillType = "tile";
        };
        color.hex = config.stylix.base16Scheme.base03;
      };
      fonts.desktop = {
        name = "Rubik";
        size = 11;
      };
      fonts.terminal = {
        name = "Terminus";
        # name = "Bm437 NEC APC3 8x16";
        size = 12;
      };
      sddm = {
        scale = 1.4;
        wallpaper = ../../wallpapers/a_close_up_of_flowers.jpg;
      };
    };
    bundles = {
      base.enable = true;
      base.ssh.allowRootLogin = true;
      base.starshipFormat = 1;
      desktopBase.enable = true;
      desktopBase.plymouth.enable = false;
      desktopBase.windowManager = "hyprland";
      desktopBase.displayManager = "ly";
      desktopBase.mpv.profile = "fast";
      desktopFull.enable = true;
    };
    features = {
      # lutgen.enable = true;
      krita.enable = true;
    };
    hardwareFeatures = {
      touchscreen = {
        enable = true;
        hyprlandGestureSensitivity = 4.0;
      };
      ssd.enable = true;
      laptop.enable = true;
    };
  };
}
