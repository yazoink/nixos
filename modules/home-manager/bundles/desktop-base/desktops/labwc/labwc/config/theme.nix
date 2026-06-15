{
  config,
  osConfig,
  ...
}: let
  inherit (config.stylix) fonts;
  inherit (osConfig.desktopTheme) icons;
in {
  theme = {
    # name = "${config.gtk.theme.name}";
    name = "my-labwc";
    cornerRadius = 10;
    font = {
      "@name" = "${fonts.sansSerif.name}";
      "@size" = "${builtins.toString fonts.sizes.desktop}";
      "@weight" = "bold";
    };
    icon = "${icons.name}";
    titlebar = {
      showTitle = "yes";
      # layout = "icon:iconify,max,close";
      layout = "close,iconify,max:";
      dropShadows = "yes";
      dropShadowsOnTiled = "yes";
    };
  };
}
