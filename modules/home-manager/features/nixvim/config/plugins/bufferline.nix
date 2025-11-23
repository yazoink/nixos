{
  config,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme enable;
  polarity = "dark";
in {
  bufferline = {
    enable = true;
    settings = {
      options = {
        separator_style = "thin"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
      };
      highlights = lib.mkIf enable {
        fill = {
          fg = "none";
          bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
        };
        background = {
          fg = "none";
          bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
        };
        buffer = {
          fg = "none";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
          bold = false;
          italic = false;
        };
        buffer_selected = {
          fg = "#${config.stylix.base16Scheme.base05 or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
          bold = false;
          italic = false;
        };
        buffer_visible = {
          fg = "#${config.stylix.base16Scheme.base05 or "ffffff"}";
          bg = "#${base16Scheme.base00}";
          bold = false;
          italic = false;
        };
        close_button = {
          fg = "none";
          bg = "#${base16Scheme.base00}";
        };
        close_button_visible = {
          fg = "#${config.stylix.base16Scheme.base03 or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        close_button_selected = {
          fg = "#${config.stylix.base16Scheme.base08 or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        indicator_selected = {
          fg = "#${config.stylix.base16Scheme.base0E or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        indicator_visible = {
          fg = "#${config.stylix.base16Scheme.base0E or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        separator = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg = "#${base16Scheme.base00}";
        };
        separator_selected = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg = "#${base16Scheme.base00}";
        };
        separator_visible = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg = "#${base16Scheme.base00}";
        };
        modified = {
          fg = "#${config.stylix.base16Scheme.base03 or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        modified_visible = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        modified_selected = {
          fg = "#${config.stylix.base16Scheme.base0B or "ffffff"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        tab_close = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        duplicate = {
          bg = "none";
          italic = false;
        };
        duplicate_visible = {
          bg = "none";
          italic = false;
        };
        duplicate_selected = {
          fg = "none";
          bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          italic = false;
        };
      };
    };
  };
}
