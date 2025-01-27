{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "paradise") {
    gtk = {
      iconTheme.name = "Papirus-Paradise-Yellow";
    };
  };
}
