{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.features.ollama.enable {
    services.ollama.enable = true;
    environment.systemPackages  = with pkgs; [alpaca];
  };
}
