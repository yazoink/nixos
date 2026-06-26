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
      colorscheme = "biscuit-de-mar-light";
      # colorscheme = "camellia";
      # colorscheme = "paradise";
      rice.labwc-flat.enable = true;
      rice.hyprland-flat.enable = false;
      # name = "everblush";
      wallpaper = {
        type = "image";
        image = {
          fillType = "tile";
          path = pkgs.fetchurl {
            # url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/trees-and-leaves/wall1.jpg";
            # hash = "sha256-H8Hsm73MPbqrKl4RUiAhKUlkXPSntyghB95PpTmkuKM=";

            # url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/flowers/a_group_of_purple_flowers2.png";
            # hash = "sha256-QmP4czF4Mp2UN0kOBrVmo/VRCdpfDETQPwesxdYjRJs=";

            # url = "https://github.com/yazoink/wallpapers/blob/main/tiling/flowers5.jpg?raw=true";
            # hash = "sha256-UnDjygcXsn3x1sN3Q6VbU9l62l1EhI9DbqN1dXRknNk=";

            url = "https://github.com/wallace-aph/tiles-and-such/blob/master/Floral/Elfst40.jpg?raw=true";
            hash = "sha256-kjDhlUcTDh5Ywsq4BZSwZn3IfW375e54L1air75PN4I=";
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
        size = 11;
      };
      fonts.terminal = {
        name = "cozette";
        size = 15;
      };
    };
    bundles = {
      base.starshipFormat = 1;
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
