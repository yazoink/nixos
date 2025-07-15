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
      name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/flowers-1.jpg;
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
      desktopBase.plymouth.enable = true;
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
