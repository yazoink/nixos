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
      name = "tarot";
      wallpaper = ./wallpapers/tarot-flowers.jpg;
      sddm = {
        scale = 1.3;
        wallpaper = ./wallpapers/tarot-flowers.jpg;
      };
      firefoxCss.shyfox = {
        enable = true;
        wallpaper = ./wallpapers/tarot-flowers.jpg;
      };
    };
    bundles = {
      desktopFull.enable = true;
    };
    features = {
      fstrim.enable = true;
      tlp.enable = true;
      virtManager.enable = true;
      virtualbox.enable = true;
      diskBurner.enable = true;
      vscode.enable = true;
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
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
