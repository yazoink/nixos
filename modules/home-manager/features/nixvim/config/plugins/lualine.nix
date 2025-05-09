{
  config,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme enable;
in {
  lualine = builtins.trace "base00 is ${base16Scheme.base00 or "000000"}" {
    enable = true;
    #lazyLoad.settings.event = "BufEnter";
    settings = {
      options = {
        theme = lib.mkIf enable {
          normal = {
            a = {
              bg = "#${base16Scheme.base00 or "000000"}";
            };
            b = {
              bg = "#${base16Scheme.base00 or "000000"}";
            };
            c = {
              bg = "#${base16Scheme.base00 or "000000"}";
            };
            z = {
              bg = "#${base16Scheme.base00 or "000000"}";
            };
            y = {
              bg = "#${base16Scheme.base00 or "000000"}";
            };
          };
        };
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
            "snacks_dashboard"
          ];
        };
      };
      inactive_sections = {
        lualine_x = [
          "filename"
          "filetype"
        ];
      };
      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt = "string.lower";
            color = lib.mkIf enable {
              fg = "#${base16Scheme.base04 or "ffffff"}";
              bg = "#${base16Scheme.base00 or "000000"}";
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            color = lib.mkIf enable {
              fg = "#${base16Scheme.base04 or "ffffff"}";
              bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
            };
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "diff";
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_c = [
          {
            __unkeyed = "diagnostic";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
            color = lib.mkIf enable {
              fg = "#${config.stylix.base16Scheme.base08 or "ffffff"}";
              bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_x = [""];
        lualine_y = [
          {
            __unkeyed = "filetype";
            icon_only = true;
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "filename";
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
            color = lib.mkIf enable {
              fg = "#${config.stylix.base16Scheme.base05 or "ffffff"}";
              bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_z = [
          {
            __unkeyed = "location";
            color = lib.mkIf enable {
              fg = "#${config.stylix.base16Scheme.base0B or "ffffff"}";
              bg = "#${config.stylix.base16Scheme.base00 or "000000"}";
            };
            separator.left = "";
            separator.right = "";
          }
        ];
      };
    };
  };
}
