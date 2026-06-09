{
  config,
  pkgs,
  ...
}: {
  myOptions = {
    defaultApps = {
      discordClient = {
        command = "vesktop";
      };
      webBrowser.command = "zen-twilight";
      terminal = {
        command = "footclient";
      };
      mediaPlayer.command = "mpv";
      documentReader.command = "zathura";
      fileManager.command = "thunar";
    };
    userAccount.username = "gene";
    desktopTheme = {
      rice.labwc.enable = true;
      rice.hyprland.enable = false;
      # zenBrowserShowBorders = false;
      colorscheme = "paradise";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/paintings/painting3.jpg";
            hash = "sha256-BzrYxsHcZ/l2ZdZ1pwSmtMXgFaPNFDWUObjIzSy3Gh8=";
          };
        };
      };
      windowGaps = {
        inner = 5;
        outer = 10;
      };
      fonts = {
        desktop = {
          name = "Gabarito";
          size = 12;
        };
        terminal = {
          # name = "Cozette";
          # name = "Terminess Nerd Font";
          name = "Aporetic Serif Mono";
          size = 12;
        };
      };
    };
    bundles = {
      # base.starshipFormat = 1;
      base.starshipFormat = 2;
      desktopBase.silentBoot.enable = true;
      desktopBase.mpv.profile = "fast";
      desktopBase.plymouth.enable = false;
      # desktopBase.enable = true;
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
    };
    features = {
      virtManager.enable = true;
      # virtualbox.enable = true;
      # expenses.enable = true;
      calibre.enable = true;
      # obsidian.enable = true;
      lutgen.enable = true;
    };
    hardwareFeatures = {
      bootloader.type = "legacy";
      ssd.enable = true;
      bluetooth.enable = true;
      # diskBurner.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.15;
        labwcTouchpadScrollFactor = 0.15;
        batteryName = "BAT0";
      };
    };
  };
}
