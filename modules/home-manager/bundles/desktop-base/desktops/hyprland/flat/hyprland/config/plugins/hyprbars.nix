{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: let
  inherit (config.lib.stylix) colors;
  themeName = osConfig.myOptions.bundles.desktopBase.desktop.colorscheme;
  closeButtonColor = with colors;
    if (themeName == "caroline")
    then base0E
    else
      (
        if (themeName == "decay")
        then base0C
        else base08
      );
in {
  plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    pkgs.hyprlandPlugins.hyprbars
  ];
  settings = with colors; {
    plugin = {
      hyprbars = {
        bar_title_enabled = false; # bold text broken?
        bar_color = "rgb(${base00})";
        inactive_button_color = "rgb(${base03})";
        bar_height = 38;
        bar_text_font = config.gtk.font.name;
        bar_text_weight = "bold";
        bar_text_size = config.gtk.font.size + 4;
        bar_text_align = "center";
        bar_precedence_over_border = true;
        bar_padding = 15;
        bar_button_padding = 10;
        disable_initialization_message = true;
        on_double_click = "hyprctl dispatch fullscreen 1";
        "col.text" = "rgb(${base04})";
        bar_buttons_alignment = "left";
        bar_part_of_window = true;
        hyprbars-button = [
          "rgb(${closeButtonColor}), 15, , hyprctl dispatch killactive, rgb(${closeButtonColor})"
          "rgb(${base0A}), 15, , hyprctl dispatch movetoworkspacesilent special, rgb(${base0A})"
          "rgb(${base0B}), 15, , hyprctl dispatch fullscreen 1, rgb(${base0B})"
        ];
      };
    };
    windowrule = [
      "match:focus true, hyprbars:title_color rgb(${base05})"
      # "match:focus true, hyprbars:bar_color rgb(${base16Scheme.base00})"
      "match:class ^(org.kde.kruler), hyprbars:no_bar true"
      "match:class ^(Select Destination Folder), hyprbars:no_bar true"
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
