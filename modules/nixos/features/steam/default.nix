{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.steam.enable {
    programs = {
      steam = {
        enable = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        package = pkgs.steam.override {
          extraLibraries = p: with p; [
            (lib.getLib networkmanager)
          ];
        };
      };
    };
  };
}
