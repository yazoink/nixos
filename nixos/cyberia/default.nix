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
    desktopTheme = {
      name = "paradise";
      # name = "everblush";
      smallBars = true;
      fonts.terminal = {
        name = "Consolas";
        size = 12;
      };
      fonts.desktop = {
        name = "SF Pro Display";
        size = 11;
      };
      # wallpaper = ./wallpapers/clouds6.jpg;
      wallpaper = ./wallpapers/paradise/grey.png;
      sddm = {
        scale = 1.3;
        # wallpaper = ./wallpapers/clouds6.jpg;
        wallpaper = ./wallpapers/paradise/grey.png;
      };
      firefoxCss.stylix.enable = true;
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.displayManager = "sddm";
      desktopFull.enable = true;
    };
    features = {
      virtManager.enable = true;
      virtualbox.enable = true;
      spaceCadetPinball.enable = true;
      prismlauncher.enable = true;
      retroarch.enable = true;
      lutgen.enable = true;
    };
    hardwareFeatures = {
      diskBurner.enable = true;
      ssd.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        touchpadScrollFactor = 0.5;
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
