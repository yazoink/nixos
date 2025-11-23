{
  config,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme enable polarity;
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
          bg =
            if (polarity == "dark")
            then "#${config.stylix.base16Scheme.base00 or "000000"}"
            else "none";
        };
        background = {
          fg = "none";
          bg =
            if (polarity == "dark")
            then "#${config.stylix.base16Scheme.base00 or "000000"}"
            else "none";
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
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
          bold = false;
          italic = false;
        };
        close_button = {
          fg = "none";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
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
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        separator_selected = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
        };
        separator_visible = {
          fg = "#${config.stylix.base16Scheme.base00 or "000000"}";
          bg =
            if (polarity == "dark")
            then "#${base16Scheme.base00}"
            else "none";
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
