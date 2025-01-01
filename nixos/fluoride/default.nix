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

  myOptions = builtins.trace "options set" {
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
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      name = "blood-rust";
      wallpaper = ./wallpapers/caroline-flowers.png;
      sddm = {
        scale = 1;
        wallpaper = ./wallpapers/caroline-waves.png;
      };
      firefoxCss.anotherOneline.enable = true;
    };
    bundles = {
      desktopFull.enable = true;
    };
    features = {
      etterna.enable = true;
      prismlauncher.enable = true;
      osu.enable = true;
      ollama.enable = true;
      steam.enable = true;
      gamescope.enable = true;
      virtManager.enable = true;
    };
    hardwareFeatures = {
      amdgpu.enable = true;
      ssd.enable = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
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

  networking.hostName = "fluoride";

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
