{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopBase.eww.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config =
    lib.mkIf config.bundles.desktopBase.eww.enable {
    };
}
