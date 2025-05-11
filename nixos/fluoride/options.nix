{config, ...}: {
  myOptions = builtins.trace "options set" {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      fileManager = {
        command = "thunar";
      };
      guiTextEditor = {
        command = "vscode";
      };
      documentReader = {
        command = "atril";
      };
      mediaPlayer = {
        command = "vlc";
      };
      imageViewer = {
        command = "imv";
      };
      terminal = {
        command = "kitty";
      };
      webBrowser = {
        command = "firefox";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      # name = "paradise";
      name = "biscuit-de-mar-dark";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/BouquetOnOliveGreen-darker.jpg;
        };
      };
      terminalPadding = 24;
      fonts.desktop = {
        # name = "SF Pro Display";
        name = "Rubik";
        size = 11;
      };
      fonts.terminal = {
        name = "Iosevka Nerd Font";
        # name = "Bm437 NEC APC3 8x16";
        size = 12;
      };
      sddm = {
        scale = 0.8;
        wallpaper = ../../wallpapers/a_close_up_of_flowers.jpg;
      };
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.windowManager = "hyprland";
      desktopFull.enable = true;
    };
    features = {
      etterna.enable = true;
      prismlauncher.enable = true;
      osu.enable = true;
      ollama.enable = true;
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
