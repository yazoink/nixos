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
      name = "caroline";
      wallpaper = ./wallpapers/caroline-flowers.png;
      sddm = {
        scale = 0.7;
        wallpaper = ./wallpapers/caroline-waves.png;
      };
      firefoxCss.shyfox = {
        enable = true;
        wallpaper = ./wallpapers/caroline-waves.png;
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
