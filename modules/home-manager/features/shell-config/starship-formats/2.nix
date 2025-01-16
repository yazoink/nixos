{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.base.starshipFormat == 1) {
    # default format
  };
}
