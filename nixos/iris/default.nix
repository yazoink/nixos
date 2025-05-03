{
  inputs,
  pkgs,
  ...
}: {
  # ----- IMPORTS ----- #
  imports = [
    ./hardware-configuration.nix
    ./options.nix
    ../../modules/nixos
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  # ----- HOME MANAGER ----- #
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

  # ----- GRAPHICS DRIVERS ----- #

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # if using steam

      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-compute-runtime
        libvdpau-va-gl
        libva
        libva-utils
        intel-media-driver
        intel-vaapi-driver
      ];
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  # ----- HOSTNAME ----- #
  # Make sure it's the same as in the flake.

  networking.hostName = "iris";
}
