{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.guiTextEditor.command == "pluma") {
    defaultApps.guiTextEditor.desktopFile = "pluma.desktop";
    home.packages = [pkgs.mate.pluma];
  };
}
