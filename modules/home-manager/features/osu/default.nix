{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.osu.enable {
    home.packages = with pkgs; [osu-lazer-bin];
  };
}
