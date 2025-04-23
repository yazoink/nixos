# depends on system theme module
{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "biscuit-de-sol-light") {
    stylix = {
      iconTheme.dark = "papirus-biscuit-light";
    };
  };
}
