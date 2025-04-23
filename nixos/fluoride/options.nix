{config, ...}: {
  myOptions = builtins.trace "options set" {
    defaultApps = {
      discordClient = {
        command = "legcord";
        desktopFile = "legcord.desktop";
      };
      fileManager = {
        command = "thunar";
        desktopFile = "thunar.desktop";
      };
      guiTextEditor = {
        command = "pluma";
        desktopFile = "pluma.desktop";
      };
      documentReader = {
        command = "atril";
        desktopFile = "atril.desktop";
      };
      mediaPlayer = {
        command = "vlc";
        desktopFile = "vlc.desktop";
      };
      imageViewer = {
        command = "ristretto";
        desktopFile = "org.xfce.ristretto.desktop";
      };
      terminal = {
        command = "kitty";
        desktopFile = "kitty.desktop";
      };
      webBrowser = {
        command = "firefox";
        desktopFile = "firefox.desktop";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      # name = "paradise";
      name = "paradise";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/wall1.jpg;
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
        wallpaper = ../../wallpapers/paradise/clouds_paradise_1.jpg;
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
    };
    hardwareFeatures = {
      ssd.enable = true;
    };
  };
}
