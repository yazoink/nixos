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
      name = "caroline";
      #name = "wizard";
      wallpaper = ./wallpapers/caroline-flowers2.png;
      #wallpaper = ./wallpapers/flowers-wizard.jpg;
      sddm = {
        scale = 1.3;
        wallpaper = ./wallpapers/caroline-flowers3.png;
        #wallpaper = ./wallpapers/sand-wizard.jpg;
      };
      firefoxCss.anotherOneline.enable = true;
    };
    bundles = {
      desktopBase.displayManager = "sddm";
      desktopFull.enable = true;
    };
    features = {
      virtManager.enable = true;
      virtualbox.enable = true;
      spaceCadetPinball.enable = true;
      prismlauncher.enable = true;
      retroarch.enable = false;
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
    useGlobalPkgs = true;
    useUserPackages = false;
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
