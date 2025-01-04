{inputs, pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.greetd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.greetd.enable {
    programs.regreet = {
      enable = true;
    };
  };
}
