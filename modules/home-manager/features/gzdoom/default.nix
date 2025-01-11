{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.gzdoom.enable {
    home.packages = with pkgs; [gzdoom];
  };
}
