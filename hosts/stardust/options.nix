{pkgs, ...}: {
  myOptions = builtins.trace "options set" {
    userAccount = {
      username = "gene";
    };
    bundles = {
      base.starshipFormat = 1;
      desktopBase = {
        desktop = {
          windowManager = {
            name = "labwc";
            labwc = {
              style = "flat";
            };
          };
          colorscheme = "camellia";
          fonts.desktop = {
            name = "gabarito";
            size = 11;
          };
          fonts.terminal = {
            name = "cozette";
            size = 15;
          };
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

                # url = "https://github.com/wallace-aph/tiles-and-such/blob/master/Floral/Elfst40.jpg?raw=true";
                # hash = "sha256-kjDhlUcTDh5Ywsq4BZSwZn3IfW375e54L1air75PN4I=";

                # url = "https://github.com/wallace-aph/tiles-and-such/blob/master/Floral/9.jpg?raw=true";
                # hash = "sha256-Hvm41hRGVo11hlUVdV6Pju8FKMO5zstX9U7tLNweisg=";

                url = "https://github.com/wallace-aph/tiles-and-such/blob/master/Personal/dolphin2.png?raw=true";
                hash = "";
              };
            };
          };
        };
      };
      desktopFull.enable = true;
      art.enable = true;
      dev.enable = true;
    };
    defaultApps = {
      discordClient = "vesktop";
      fileManager = "thunar";
      guiTextEditor = "gedit";
      documentReader = "zathura";
      mediaPlayer = "mpv";
      imageViewer = "imv";
      terminal = "foot";
      webBrowser = "zen-twilight";
    };
    features = {
      # etterna.enable = true;
      garfetch = {
        enable = true;
        style = 2;
      };
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
