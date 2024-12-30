{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.minetest.enable {
    home.packages = with pkgs; [minetest];
  };
}
