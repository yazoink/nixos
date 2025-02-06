# depends on system theme module
{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "rose-pine-moon") {
    stylix = {
      iconTheme.dark = "Rose-Pine-Moon";
    };
  };
}
