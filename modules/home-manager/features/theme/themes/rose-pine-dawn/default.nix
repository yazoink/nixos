# depends on system theme module
{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "rose-pine-dawn") {
    stylix = {
      targets.nixvim = false;
      iconTheme = {
        light = "rose-pine-dawn-icons";
        package = pkgs.rose-pine-icon-theme;
      };
    };
  };
}
