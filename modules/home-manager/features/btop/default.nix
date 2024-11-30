{config, lib, ...}:
{
  options = {
    bundles.base.btop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.btop.enable {
    programs.btop.enable = true;
  };
}
