{
  pkgs,
  osConfig,
  ...
}: let
  garfetch = pkgs.callPackage ./garfetch.nix {};
in {
  home.packages = [garfetch];
  home.file.".config/garfetch".source =
    if (osConfig.networking.hostName == "fluoride")
    then ./config-2
    else ./config-1;
}
