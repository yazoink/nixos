{config, ...}: {
  myOptions = builtins.trace "options set" {
    defaultApps = {
      discordClient = {
        command = "legcord";
      };
      fileManager = {
        command = "thunar";
      };
      guiTextEditor = {
        command = "pluma";
      };
      documentReader = {
        command = "atril";
      };
      mediaPlayer = {
        command = "vlc";
      };
      imageViewer = {
        command = "ristretto";
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
      name = "rose-pine-dawn";
      wallpaper = {
        type = "color";
        image = {
          path = ../../wallpapers/rose-pine/flowers-rose-pine3.png;
          fillType = "fill";
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
        wallpaper = ../../wallpapers/rose-pine/flowers-rose-pine3.png;
      };
    };
    bundles = {
      desktopBase.enable = true;
      desktopBase.windowManager = "hyprland";
      # desktopFull.enable = true;
    };
    features = {
      lutgen.enable = true;
    };
    hardwareFeatures = {
      ssd.enable = true;
      h264ify.enable = true;
      laptop.enable = true;
    };
  };
}
