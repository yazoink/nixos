{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.eduke32.enable {
    home.packages = with pkgs; [eduke32];
  };
}
