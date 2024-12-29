{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.spaceCadetPinball.enable {
    home.packages = with pkgs; [space-cadet-pinball];
  };
}
