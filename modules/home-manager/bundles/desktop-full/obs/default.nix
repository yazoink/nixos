{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopFull.obs.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.obs.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}
