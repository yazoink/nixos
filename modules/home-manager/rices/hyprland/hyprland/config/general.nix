{
  config,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  inherit (osConfig.myOptions.desktopTheme.windowGaps) inner outer;
  borderColor = "rgb(${base16Scheme.base01})";
in {
  debug = {
    disable_logs = false;
  };
  general = {
    gaps_in = inner;
    gaps_out = outer;
    border_size = 1;
    layout = "scrolling";
    allow_tearing = false;
    "col.inactive_border" = borderColor;
    "col.active_border" = borderColor;
    resize_on_border = true;
    extend_border_grab_area = 15;
    hover_icon_on_border = true;
  };
  decoration = {
    rounding = 15;
    blur.enabled = false;
    shadow = {
      enabled = true;
      range = 5;
      offset = "0 0";
      render_power = 5;
      color =
        if (config.stylix.polarity == "dark")
        then "rgba(00000040)"
        else "rgba(00000010)";
    };
  };
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    # disable_hyprland_qtutils_check = true;
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
  /*
      dwindle = {
      preserve_split = true;
  };
  */
  scrolling = {
    fullscreen_on_one_column = true;
    column_width = 0.5;
    # 0 = center, 1 = fit
    focus_fit_method = 1;
    follow_min_visible = 0.4;
    wrap_focus = true;
    wrap_swapcol = true;
    direction = "right";
  };
}
