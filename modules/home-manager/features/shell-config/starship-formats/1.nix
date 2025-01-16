{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.base.starshipFormat == 1) {
    programs.starship.settings = {
      format = ''[>](blue)[>](red)[>](yellow) '';
      right_format = ''[$directory](green)'';
    };
  };
}
