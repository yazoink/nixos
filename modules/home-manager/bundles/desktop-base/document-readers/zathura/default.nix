{config, ...}: let
  desktopFile = "org.pwmt.zathura.desktop";
in {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font "sans ${builtins.toString config.gtk.font.size}"
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
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [desktopFile];
    "image/vnd.djvu" = [desktopFile];
    "application/epub+zip" = [desktopFile];
  };
}
