{
  config,
  osConfig,
  ...
}: let
  themeName = osConfig.myOptions.desktopTheme.name;
  inherit (config.stylix) base16Scheme;
  borderColor =
    if (themeName == "catppuccin-mocha")
    then "rgb(${base16Scheme.base02})"
    else "rgb(${base16Scheme.base01})";
in {
  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 1;
    layout = "dwindle";
    allow_tearing = false;
    "col.inactive_border" = borderColor;
    "col.active_border" = borderColor;
    resize_on_border = true;
    extend_border_grab_area = 15;
    hover_icon_on_border = true;
  };
  decoration = {
    rounding = 20;
    blur.enabled = false;
    shadow = {
      enabled = true;
      ignore_window = true;
      range = 20;
      offset = "0 0";
      render_power = 4;
      color = "rgba(00000030)";
    };
  };
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    disable_hyprland_qtutils_check = true;
    vfr = true;
    vrr = true;
    enable_swallow = true;
    swallow_regex = "(foot|kitty|alacritty|Alacritty)";
    force_default_wallpaper = 0;
    font_family = config.stylix.fonts.sansSerif.name;
  };
  ecosystem = {
    no_donation_nag = true;
  };
  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };
}
