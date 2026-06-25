{
  config,
  osConfig,
  ...
}: let
  inherit (config.stylix) fonts;
  icons = config.gtk.iconTheme.name;
in {
  theme = {
    # name = "${config.gtk.theme.name}";
    name = "my-labwc";
    cornerRadius = 16;
    font = {
      "@name" = "${fonts.sansSerif.name}";
      "@size" = "${builtins.toString fonts.sizes.desktop}";
      "@weight" = "bold";
    };
    dropShadows = "yes";
    # dropShadowsOnTiled = "yes";
    icon = "${icons}";
    titlebar = {
      showTitle = "yes";
      # layout = "icon:iconify,max,close";
      layout = "close,iconify,max:";
    };
  };
}
