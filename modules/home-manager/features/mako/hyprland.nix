{osConfig, config, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    services.mako = {
      borderColor = "#${config.stylix.base16Scheme.base01}";
      borderSize = 2;
      anchor = "top-right";
    };
  };
}
