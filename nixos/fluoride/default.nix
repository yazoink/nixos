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
    userAccount = {
      username = "gene";
    };
    desktopTheme = {
      name = "tarot";
      wallpaper = ./wallpapers/tarot-flowers.jpg;
      sddm = {
        scale = 0.7;
        wallpaper = ./wallpapers/tarot-waves.png;
      };
      firefoxCss.shyfox = {
        enable = true;
        wallpaper = ./wallpapers/tarot-waves.png;
      };
    };
    bundles = {
      desktopFull.enable = true;
    };
    features = {
      amdgpu.enable = true;
      fstrim.enable = true;
      ollama.enable = true;
      steam.enable = true;
      gamescope.enable = true;
      virtManager.enable = true;
      vscode.enable = false;
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
