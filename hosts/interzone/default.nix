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
    # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x220
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs-stable;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${config.myOptions.userAccount.username}" = {
      imports = [
        ../../home-manager
      ];
    };
  };

  environment.systemPackages = with pkgs; [prismlauncher];

  networking.hostName = "interzone";

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.kernelParams = ["i915.enable_rc6=7"];

  hardware.graphics = {
    enable = true;
    package = pkgs-stable.mesa;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
      intel-media-sdk
    ];
  };

  nixpkgs.config.permittedInsecurePackages = ["intel-media-sdk-23.2.2"];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
    VDPAU_DRIVER = "va_gl";
  };

  services.xserver.videoDrivers = ["modesetting" "fbdev"];
}
