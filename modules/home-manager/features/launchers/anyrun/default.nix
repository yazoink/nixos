{config, inputs, lib, osConfig, ...}:
{
  options = {
    bundles.desktopBase.anyrun.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.anyrun.enable {
    home.packages = [inputs.packages."x86_64-linux".anyrun];
  };
}
