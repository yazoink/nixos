{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  themeName = osConfig.myOptions.desktopTheme.name;
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
        bar_color = "rgb(${base16Scheme.base00})";
        bar_height = 36;
        bar_text_font = "${fonts.sansSerif.name} Bold";
        bar_text_size = fonts.sizes.applications;
        bar_text_align = "center";
        bar_precedence_over_border = true;
        bar_padding = 15;
        bar_button_padding = 12;
        disable_initialization_message = true;
        "col.text" = "rgb(${base16Scheme.base03})";
        bar_buttons_alignment = "left";
        bar_part_of_window = true;
        hyprbars-button = [
          "rgb(${closeButtonColor}), 15, , hyprctl dispatch killactive, rgb(${closeButtonColor})"
          "rgb(${base16Scheme.base0A}), 15, , hyprctl dispatch movetoworkspacesilent special, rgb(${base16Scheme.base0A})"
          "rgb(${base16Scheme.base0B}), 15, , hyprctl dispatch fullscreen 1, rgb(${base16Scheme.base0B})"
        ];
      };
    };
    windowrulev2 = [
      "plugin:hyprbars:title_color rgb(${base16Scheme.base05}), focus:1"
      "plugin:hyprbars:nobar, class:^(org.kde.kruler)"
      "plugin:hyprbars:nobar, title:^(vesktop)$"
      "plugin:hyprbars:nobar, title:^(File Upload)$"
      "plugin:hyprbars:nobar, title:^(Empty Trash)$"
      "plugin:hyprbars:nobar, title:^(File Manager Preferences)$"
      "plugin:hyprbars:nobar, title:^(Choose a color)$"
      "plugin:hyprbars:nobar, title:^(Open File)$"
      "plugin:hyprbars:nobar, title:^(Thunar Preferences)$"
    ];
  };
}
