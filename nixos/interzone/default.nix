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
    # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x220
  ];

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

  networking.hostName = "interzone";

  nixpkgs.config.permittedInsecurePackages = ["intel-media-sdk-23.2.2"];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #environment.sessionVariables = {
  #  LIBVA_DRIVER_NAME = "i965";
  #};

  boot.kernelParams = ["i915.enable_rc6=7"];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
      # intel-media-sdk
    ];
  };
}
