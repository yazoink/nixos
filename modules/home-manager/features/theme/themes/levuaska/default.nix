{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "levuaska") {
    stylix = {
      iconTheme.dark = "Papirus-Levuaska";
    };
  };
}
