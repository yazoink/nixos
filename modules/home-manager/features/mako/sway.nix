{osConfig, config, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    services.mako = {
      borderColor = "#${config.stylix.base16Scheme.base00}";
      borderSize = 0;
    };
  };
}