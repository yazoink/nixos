{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.prismlauncher.enable {
    home.packages = with pkgs; [prismlauncher];
  };
}
