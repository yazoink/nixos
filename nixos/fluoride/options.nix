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
        command = "firefox";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      # name = "paradise";
      name = "idk-what-this-one-is-called";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/a_group_of_purple_flowers2.png;
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
        wallpaper = ../../wallpapers/a_group_of_purple_flowers2.png;
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
