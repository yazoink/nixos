{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.myOptions.features.ollama.enable {
    services.ollama = {
      enable = true;
      wantedBy = pkgs.lib.mkForce []; # disable until explicitly enabled
      #acceleration = "rocm"; # no support for RX 6600 :()
    };
  };
}
