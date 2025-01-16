{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.retroarch.enable {
    environment.systemPackages = with pkgs; [
      retroarch-full
    ];
  };
}
