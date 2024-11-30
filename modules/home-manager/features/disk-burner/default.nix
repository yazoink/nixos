{pkgs, osConfig, lib, ...}:
{
  options.myOptions.features.diskBurner.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf osConfig.myOptions.features.diskBurner.enable {
    home.packages = with pkgs; [
      brasero
      dvdplusrwtools
    ];
  };
}
