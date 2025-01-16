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
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  myOptions = {
    userAccount.username = "gene";
    desktopTheme = {
      name = "everblush";
      wallpaper = ./wallpapers/flowers-downscaled.jpg;
      fonts = {
        desktop.name = "SF Pro Display";
        terminal = {
          name = "Iosevka Nerd Font";
          size = 12;
        };
      };
      sddm = {
        scale = 1.3;
        wallpaper = ./wallpapers/flowers-downscaled.jpg;
      };
      firefoxCss.anotherOneline.enable = true;
    };
    bundles = {
      base.starshipFormat = 2;
      desktopBase.windowManager = "sway";
      desktopBase.displayManager = "sddm";
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
    };
    features = {
      minetest.enable = true;
      pychess.enable = true;
      knavalbattle.enable = true;
      gzdoom.enable = true;
      eduke32.enable = true;
      prismlauncher.enable = true;
      superTuxKart.enable = true;
    };
    hardwareFeatures = {
      ssd.enable = true;
      diskBurner.enable = true;
      h264ify.enable = true;
      laptop = {
        enable = true;
        touchpadScrollFactor = 0.5;
        batteryName = "BAT1";
      };
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    #useGlobalPkgs = true;
    #useUserPackages = true;
    users."${config.myOptions.userAccount.username}" = {
      imports = [
        ../../home-manager
      ];
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "stardust";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #PasswordAuthentication = false;
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
      intel-media-sdk
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
