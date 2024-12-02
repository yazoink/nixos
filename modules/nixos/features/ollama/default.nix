{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.myOptions.features.ollama.enable {
    services.ollama = {
      enable = true;
      #acceleration = "rocm"; # no support for RX 6600 :()
    };
    systemd.services.ollama.wantedBy = pkgs.lib.mkForce []; # disable by default
  };
}
