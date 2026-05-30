{pkgs, config, nixosConfig, lib, ...}:
let
  garfetch = pkgs.callPackage ./garfetch.nix {};
in
{
  options = {
    bundles.base.garfetch.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.garfetch.enable {
    home.packages = [garfetch];
    home.file.".config/garfetch".source = 
      if (nixosConfig.networking.hostName == "cyberia") then ./cyberia-config 
      else ./fluoride-config;
  };
}
