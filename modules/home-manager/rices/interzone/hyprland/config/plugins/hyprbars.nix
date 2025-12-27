{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  themeName = osConfig.myOptions.desktopTheme.colorscheme;
  closeButtonColor =
    if (themeName == "caroline")
    then base16Scheme.base0E
    else
      (
        if (themeName == "decay")
        then base16Scheme.base0C
        else base16Scheme.base08
      );
in {
  plugins = [
    inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
  ];
  settings = {
    plugin = {
      hyprbars = {
        bar_color = "rgb(${base16Scheme.base01})";
        inactive_button_color = "rgb(${base16Scheme.base04})";
        bar_height = 42;
        bar_text_font = "${fonts.sansSerif.name} Bold";
        bar_text_size = fonts.sizes.applications;
        bar_text_align = "center";
        bar_precedence_over_border = true;
        bar_padding = 15;
        bar_button_padding = 10;
        disable_initialization_message = true;
        on_double_click = "hyprctl dispatch fullscreen 1";
        "col.text" = "rgb(${base16Scheme.base04})";
        bar_buttons_alignment = "left";
        bar_part_of_window = true;
        hyprbars-button = [
          "rgb(${closeButtonColor}), 15, , hyprctl dispatch killactive, rgb(${closeButtonColor})"
          "rgb(${base16Scheme.base0A}), 15, , hyprctl dispatch movetoworkspacesilent special, rgb(${base16Scheme.base0A})"
          "rgb(${base16Scheme.base0B}), 15, , hyprctl dispatch fullscreen 1, rgb(${base16Scheme.base0B})"
        ];
      };
    };
    windowrule = [
      "match:focus true, hyprbars:title_color rgb(${base16Scheme.base05})"
      "match:focus true, hyprbars:bar_color rgb(${base16Scheme.base00})"
      "match:class ^(org.kde.kruler), hyprbars:no_bar true"
      "match:class ^(Vesktop), hyprbars:no_bar true"
      "match:class ^(File Upload), hyprbars:no_bar true"
      "match:class ^(Empty Trash), hyprbars:no_bar true"
      "match:class ^(File Manager Preferences), hyprbars:no_bar true"
      "match:class ^(Choose a color), hyprbars:no_bar true"
      "match:class ^(Open File), hyprbars:no_bar true"
      "match:class ^(Thunar Preferences), hyprbars:no_bar true"
    ];
  };
}
