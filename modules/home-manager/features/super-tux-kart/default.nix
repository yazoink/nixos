{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.superTuxKart.enable {
    home.packages = with pkgs; [superTuxKart];
  };
}
