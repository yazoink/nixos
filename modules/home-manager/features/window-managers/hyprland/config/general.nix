{
  config,
  osConfig,
  ...
}: {
  general = rec {
    gaps_in = 5;
    gaps_out = 15;
    border_size = 1;
    layout = "dwindle";
    allow_tearing = false;
    "col.inactive_border" =
      if (osConfig.myOptions.desktopTheme.name == "catppuccin-mocha")
      then "rgb(${config.stylix.base16Scheme.base02})"
      else "rgb(${config.stylix.base16Scheme.base01})";
    "col.active_border" = "col.inactive_border";
  };
  decoration = {
    rounding = 10;
    blur.enabled = false;
    shadow = {
      enabled = true;
      ignore_window = true;
      range = 20;
      offset = "0 2";
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
  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };
}
