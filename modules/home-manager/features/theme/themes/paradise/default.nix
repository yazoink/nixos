{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "paradise") {
    stylix = {
      iconTheme.dark = "Papirus-Paradise-Yellow";
    };
  };
}
