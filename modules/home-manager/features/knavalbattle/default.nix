{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.knavalbattle.enable {
    home.packages = with pkgs; [kdePackages.knavalbattle];
  };
}
