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
    defaultApps = {
      fileManager = {
        command = "thunar";
        desktopFile = "thunar.desktop";
      };
      guiTextEditor = {
        command = "pluma";
        desktopFile = "pluma.desktop";
      };
      documentReader = {
        command = "atril";
        desktopFile = "atril.desktop";
      };
      mediaPlayer = {
        command = "vlc";
        desktopFile = "vlc.desktop";
      };
      imageViewer = {
        command = "ristretto";
        desktopFile = "org.xfce.ristretto.desktop";
      };
      archiver = {
        command = "file-roller";
        desktopFile = "org.gnome.FileRoller.desktop";
      };
      terminal = {
        command = "footclient";
        desktopFile = "footclient.desktop";
      };
      webBrowser = {
        command = "firefox";
        desktopFile = "firefox.desktop";
      };
    };
    desktopTheme = {
      name = "gruvbox-material-dark-hard";
      #wallpaper = ./wallpapers/caroline-flowers3.png;
      wallpaper = ./wallpapers/painting3.jpg;
      sddm = {
        scale = 1.3;
        #wallpaper = ./wallpapers/caroline-flowers2.png;
        wallpaper = ./wallpapers/painting3.jpg;
      };
      firefoxCss.anotherOneline.enable = true;
    };
    bundles = {
      desktopBase.windowManager = "sway";
      desktopBase.displayManager = "sddm";
      desktopFull.enable = true;
      desktopFull.vesktop.bloat = false;
    };
    features = {
      minetest.enable = true;
      pychess.enable = true;
      knavalbattle.enable = true;
    };
    hardwareFeatures = {
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
    useGlobalPkgs = true;
    useUserPackages = true;
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
