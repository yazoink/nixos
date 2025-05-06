{
  config,
  lib,
  ...
}: let
  style = config.lib.stylix.colors {
    template = ./style.css.mustache;
    extension = ".css";
  };
in {
  options = {
    bundles.desktopBase.swayosd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.swayosd.enable {
    services.swayosd = {
      enable = true;
      stylePath = style;
    };
  };
}
