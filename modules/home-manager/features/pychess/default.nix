{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.pychess.enable {
    home.packages = with pkgs; [pychess];
  };
}
