{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopFull.cava.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.cava.enable {
    stylix.targets.cava = {
      enable = true;
      rainbow.enable = true;
    };
    programs.cava = {
      enable = true;
    };
  };
}
