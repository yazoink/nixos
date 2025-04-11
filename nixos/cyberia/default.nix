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
      fileManager = {
        command = "thunar";
        desktopFile = "thunar.desktop";
      };
      terminal = {
        command = "alacritty";
        desktopFile = "alacritty.desktop";
      };
    };
    desktopTheme = {
      # name = "paradise";
      name = "moonfly";
      fonts.terminal = {
        name = "JetBrainsMono Nerd Font";
        # name = "SFMono";
        # name = "Bm437 NEC APC3 8x16";
        # name = "Terminus";
        size = 11;
      };
      fonts.desktop = {
        # name = "SF Pro Display";
        name = "Rubik";
        size = 11;
      };
      # wallpaper = ./wallpapers/clouds6.jpg;
      wallpaper = {
        # image = ./wallpapers/wall1.png;
        image = ./wallpapers/abstract1.jpg;
        solidColor = {
          enable = false;
          hex = config.stylix.base16Scheme.base03;
        };
      };
      sddm = {
        scale = 1.3;
        # wallpaper = ./wallpapers/clouds6.jpg;
        wallpaper = ./wallpapers/abstract1.jpg;
      };
      firefoxCss.stylix.enable = true;
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
        hyprlandTouchpadScrollFactor = 0.3;
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
