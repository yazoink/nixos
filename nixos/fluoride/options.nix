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
        command = "thunar";
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
        # command = "urxvt";
      };
      webBrowser = {
        command = "zen-twilight";
      };
    };
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      colorscheme = "paradise";
      rice.openbox.enable = false;
      rice.labwc.enable = true;
      rice.hyprland.enable = false;
      # name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/flowers/1751142470750001.jpg";
            hash = "sha256-jpfmaXcqSyiiEk336DK5OmunHONWn0l0nAnYFid7AZE=";
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
        name = "Cozette";
        size = 15;
        # name = "Terminess Nerd Font";
        # size = 12;
        # name = "Iosevka Nerd Font";
        # name = "Bm437 NEC APC3 8x16";
        # size = 12;
      };
    };
    bundles = {
      base.starshipFormat = 1;
      desktopBase.plymouth.enable = false;
      desktopFull.enable = true;
    };
    features = {
      # etterna.enable = true;
      steam.enable = true;
      gamescope.enable = true;
      virtManager.enable = true;
      lutgen.enable = true;
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
