{config, lib, ...}:
{
  options = {
    bundles.desktopFull.gamemode.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.gamemode.enable {
    programs.gamemode.enable = true;
  };
}
