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
    # inputs.nixos-hardware.nixosModules.<your hardware if it's in the repo>
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
  # I don't use Nvidia #sorry

  hardware = {
    graphics = {
      enable = true;
      # enable32Bit = true; # if using steam

      # --> Modern Intel drivers
      # extraPackages = with pkgs; [
      #   intel-media-driver
      #   intel-ocl
      #   intel-vaapi-driver
      # ];

      # --> Legacy Intel drivers
      # extraPackages = with pkgs; [
      #   intel-vaapi-driver
      #   vdpau-va-gl
      #   intel-media-sdk
      # ];

      # --> Legacy AMD drivers
      # extraPackages = with pkgs; [mesa.opencl];
    };
    # --> Modern AMD drivers
    # amdgpu = {
    #   initrd.enable = true;
    #   amdvlk = {
    #     enable = true;
    #     support32Bit.enable = true;
    #   };
    # };
  };

  # --> Legacy Intel drivers
  # environment.sessionVariables = {
  #   LIBVA_DRIVER_NAME = "i965";
  # };

  # --> Modern AMD drivers
  # services.xserver.videoDrivers = ["amdgpu"];

  # --> legacy AMD drivers
  # services.xserver.videoDrivers = ["radeon"];

  # ----- HOSTNAME ----- #
  # Make sure it's the same as in the flake.

  networking.hostName = "hostname";
}
