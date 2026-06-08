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
      rice.hyprland.enable = true;
      colorscheme = "paradise";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/trees-and-leaves/wall1.jpg";
            hash = "sha256-H8Hsm73MPbqrKl4RUiAhKUlkXPSntyghB95PpTmkuKM=";
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
        batteryName = "BAT0";
      };
    };
  };
}
