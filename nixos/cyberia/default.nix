{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./options.nix
    ../../modules/nixos
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t430
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs-stable;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users."gene" = {
      imports = [
        ../../home-manager
      ];
    };
  };

  networking.hostName = "cyberia";
}
