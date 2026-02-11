{
  config,
  pkgs,
  ...
}: {
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
      colorscheme = "carob";
      # name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = pkgs.fetchUrl {
            url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/trees-and-leaves/andrei-lazarev-QtM-8j_1o3Q.jpg";
            hash = "";
          };
        };
      };
      windowGaps = {
        inner = 5;
        outer = 15;
      };
      # terminalPadding = 24;
      fonts.desktop = {
        # name = "SF Pro Display";
      };
      fonts.terminal = {
        # name = "Terminess Nerd Font";
        # size = 12;
        # name = "Iosevka Nerd Font";
        # name = "Bm437 NEC APC3 8x16";
        # size = 12;
      };
    };
    bundles = {
      base.starshipFormat = 2;
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
      bluetooth.enable = true;
    };
  };
}
