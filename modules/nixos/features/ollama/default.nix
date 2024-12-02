{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.myOptions.features.ollama.enable {
    services.ollama = {
      enable = true;
      acceleration = "rocm";
    };
    environment.systemPackages  = with pkgs; [alpaca];
  };
}
