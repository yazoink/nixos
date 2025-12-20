{config, ...}: {
  myOptions = {
    userAccount.username = "gene";
    defaultApps = {
      # fileManager = {
      #   command = "thunar";
      # };
      terminal = {
        command = "footclient";
      };
      discordClient = {
        command = "vesktop";
      };
      guiTextEditor.command = "vscode";
    };
    desktopTheme = {
      colorscheme = "moonfly";
      fonts.terminal = {
        # name = "Iosevka Nerd Font";
        # name = "SFMono";
        # name = "Bm437 NEC APC3 8x16";
        # name = "Terminus";
        # size = 12;
      };
      fonts.desktop = {
        # name = "SF Pro Display";
        # name = "Rubik";
        # size = 11;
      };
      wallpaper = {
        type = "image";
        image = {
          fillType = "fill";
          path = ../../wallpapers/abstract1.jpg;
        };
        color = {
          hex = config.stylix.base16Scheme.base03;
        };
      };
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.plymouth.enable = false;
      desktopFull.enable = true;
    };
    features = {
      virtManager.enable = true;
      virtualbox.enable = true;
      spaceCadetPinball.enable = true;
      prismlauncher.enable = true;
      lutgen.enable = true;
      krita.enable = true;
    };
    hardwareFeatures = {
      bootloader = {
        type = "legacy";
        legacy = {
          bootDrive = "/dev/sda";
          customResolution = {
            enable = true;
            resolution = "1024x768";
          };
        };
      };
      diskBurner.enable = true;
      ssd.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.2;
        isThinkPad = true;
        batteryName = "BAT0";
      };
    };
  };
}
