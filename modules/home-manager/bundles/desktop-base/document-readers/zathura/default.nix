{
  lib,
  osConfig,
  config,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.documentReader.command == "zathura") {
    defaultApps.documentReader.desktopFile = "org.pwmt.zathura.desktop";
    programs.zathura = {
      enable = true;
      extraConfig = ''
        set font "${config.stylix.fonts.sansSerif.name} ${builtins.toString config.stylix.fonts.sizes.applications}"
        set selection-clipboard clipboard

        map J zoom out
        map K zoom in
        unmap f
        map f toggle_fullscreen
        map [fullscreen] f toggle_fullscreen
        map r reload

        map b toggle_page_mode # Toggle dual page mode

        set pages-per-row 1

        set smooth-scroll "true"
      '';
    };
  };
}
