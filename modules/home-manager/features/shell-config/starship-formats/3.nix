{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.base.starshipFormat == 1) {
    programs.starship.settings = {
      format = ''[❯](green) '';
      right_format = ''[$directory](blue)'';
    };
  };
}
