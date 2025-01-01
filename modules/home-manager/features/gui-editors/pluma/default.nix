{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.guiTextEditor.command == "pluma") {
    home.packages = [pkgs.mate.pluma];
  };
}
