# See options/default.nix for more info on these options.
{config, ...}: {
  myOptions = {
    # ----- USER ACCOUNT ----- #
    userAccount = {
      username = "gene";
    };

    # ----- BUNDLES ----- #
    bundles = {
      base = {
        enable = true;
        starshipFormat = 2;
        ssh = {
          allowPasswordAuth = true;
          allowRootLogin = false;
        };
      };
      desktopBase = {
        enable = true;
        windowManager = "hyprland";
        displayManager = "sddm";
        mpv.profile = "gpu-hq";
      };
      desktopFull = {
        enable = true;
        vesktop.bloat = true;
      };
    };

    # ----- DEFAULT APPS -----#
    defaultApps = {
      fileManager.command = "nemo";
      guiTextEditor.command = "pluma";
      documentReader.command = "atril";
      mediaPlayer.command = "vlc";
      webBrowser.command = "firefox";
      imageViewer.command = "ristretto";
      terminal.command = "kitty";
      discordClient.command = "vesktop";
    };
    desktopTheme = {
      name = "i-forgor";
      terminalPadding = 24;
      fonts = {
        terminal = {
          name = "Iosevka Nerd Font";
          size = 12;
        };
        desktop = {
          name = "Rubik";
          size = 11;
        };
      };
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/flowers-1.jpg;
        };

        # --> Only needed if wallpaper type is set to color.
        # color.hex = config.stylix.base16Scheme.base03;
      };
      # --> Only needed if display manager is set to SDDM.
      sddm = {
        scale = 1.3;
        wallpaper = config.myOptions.desktopTheme.wallpaper.image.path;
      };
    };

    # ----- FEATURES ----- #
    features = {
      # etterna.enable = true;
      lutgen.enable = true;
      # wine.enable = true;
      # eduke32.enable = true;
      # superTuxKart.enable = true;
      # gamescope.enable = true;
      # prismlauncher.enable = true;
      # retroarch.enable = true;
      # osu.enable = true;
      # gzdoom.enable = true;
      # spaceCadetPinball.enable = true;
      # pychess.enable = true;
      # knavalbattle.enable = true;
      # minetest.enable = true;
      # ollama.enable = true;
      krita.enable = true;
      steam.enable = true;
      # virtManager.enable = true;
      virtualbox.enable = true;
    };

    # ----- HARDWARE FEATURES ----- #
    hardwareFeatures = {
      # opentabletdriver.enable = true;
      touchscreen = {
        enable = true;
        hyprlandGestureSensitivity = 1.5;
      };
      # h264ify.enable = true;
      # diskBurner.enable = true;
      # ssd.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.5;
        batteryName = "BAT0";
      };

      # --> UEFI bootloader
      bootloader.type = "uefi";

      # --> Legacy bootloader
      # bootloader = {
      #   type = "legacy";
      #   legacy = {
      #     bootDrive = "/dev/sda"; # make sure this is the right drive
      #     customResolution = {
      #       enable = false;
      #       resolution = "1024x768";
      #     };
      #   };
      # };
    };
  };
}
