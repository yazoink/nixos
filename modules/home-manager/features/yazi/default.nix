{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  accent = "#${base16Scheme.${osConfig.desktopTheme.base16Accent}}";
in {
  options = {
    bundles.base.yazi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        manager = {
          ratio = [1 2 2];
          sort_by = "natural";
          linemode = "size";
          show_symlink = true;
        };
        icon = {
          rules = [];
        };
        theme = {
          filetype = {
            rules = lib.mkForce [
              {
                fg = "#${base16Scheme.base0C}";
                mime = "image/*";
              }
              {
                fg = "#${base16Scheme.base0A}";
                mime = "video/*";
              }
              {
                fg = "#${base16Scheme.base0A}";
                mime = "audio/*";
              }

              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/zip";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/gzip";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/tar";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/bzip";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/bzip2";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/7z-compressed";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/rar";
              }
              {
                fg = "#${base16Scheme.base0E}";
                mime = "application/xz";
              }

              {
                fg = "#${base16Scheme.base0B}";
                mime = "application/doc";
              }
              {
                fg = "#${base16Scheme.base0B}";
                mime = "application/pdf";
              }
              {
                fg = "#${base16Scheme.base0B}";
                mime = "application/rtf";
              }
              {
                fg = "#${base16Scheme.base0B}";
                mime = "application/vnd.*";
              }

              {
                fg = accent;
                mime = "inode/directory";
              }
            ];
          };
        };
      };
    };
  };
}
