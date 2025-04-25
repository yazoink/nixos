{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./options.nix
    ../../modules/nixos
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];

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

  hardware = {
    graphics = {
      enable = true;
      # enable32Bit = true;
      extraPackages = with pkgs; [
        mesa.opencl
      ];
    };
  };

  services.xserver.videoDrivers = ["radeon"];

  networking.hostName = "tallulah";
}
