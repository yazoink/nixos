{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.documentReader.command == "zathura") {
    defaultApps.documentReader.desktopFile = "org.pwmt.zathura.desktop";
    programs.zathura = {
      enable = true;
    };
  };
}
