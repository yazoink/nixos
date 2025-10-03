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
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  environment.systemPackages = with pkgs; [factorio]; # move later

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

  networking.hostName = "stardust";

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
      # intel-media-sdk
    ];
  };

  nixpkgs.config.permittedInsecurePackages = ["intel-media-sdk-23.2.2"];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };
}
