{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t430
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  myOptions = {
    userAccount.username = "gene";
    defaultApps = {
      # fileManager = {
      #   command = "thunar";
      #   desktopFile = "thunar.desktop";
      # };
      terminal = {
        command = "kitty";
        desktopFile = "kitty.desktop";
      };
      discordClient = {
        command = "legcord";
        desktopFile = "legcord.desktop";
      };
    };
    desktopTheme = {
      name = "moonfly";
      fonts.terminal = {
        name = "Iosevka Nerd Font";
        # name = "SFMono";
        # name = "Bm437 NEC APC3 8x16";
        # name = "Terminus";
        size = 12;
      };
      fonts.desktop = {
        # name = "SF Pro Display";
        name = "Rubik";
        size = 11;
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
      sddm = {
        scale = 1.3;
        # wallpaper = ../../wallpapers/catppuccin/galaxy-waves.jpg;
        wallpaper = ../../wallpapers/flower.jpg;
      };
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.displayManager = "sddm";
      desktopBase.windowManager = "hyprland";
      desktopFull.enable = true;
    };
    features = {
      virtManager.enable = true;
      virtualbox.enable = true;
      spaceCadetPinball.enable = true;
      prismlauncher.enable = true;
      lutgen.enable = true;
    };
    hardwareFeatures = {
      # hyprlandLegacyRenderer.enable = true;
      diskBurner.enable = true;
      ssd.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        hyprlandTouchpadScrollFactor = 0.2;
      };
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    #useGlobalPkgs = true;
    #useUserPackages = false;
    users."gene" = {
      imports = [
        ../../home-manager
      ];
    };
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      gfxmodeBios = "1024x768";
      theme = null;
      splashImage = null;
    };
  };

  networking.hostName = "cyberia";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #PasswordAuthentication = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
