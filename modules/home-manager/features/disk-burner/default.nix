{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.hardwareFeatures.diskBurner.enable {
    home.packages = with pkgs; [
      brasero
      dvdplusrwtools
    ];
  };
}
