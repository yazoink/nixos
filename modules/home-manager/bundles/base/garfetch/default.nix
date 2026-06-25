{
  pkgs,
  nixosConfig,
  ...
}: let
  garfetch = pkgs.callPackage ./garfetch.nix {};
in {
  home.packages = [garfetch];
  home.file.".config/garfetch".source =
    if (nixosConfig.networking.hostName == "cyberia")
    then ./cyberia-config
    else ./fluoride-config;
}
