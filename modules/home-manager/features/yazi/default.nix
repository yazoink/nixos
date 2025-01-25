{
  config,
  lib,
  osConfig,
  ...
}: {
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
      plugins = {
        #full-border = ./full-border;
        yaziline = ./yaziline;
      };
      initLua = ''
        --[[ require("full-border"):setup {
          type = ui.Border.PLAIN
        } --]]

        require("yaziline"):setup {
          separator_style = "liney",
          color = "#${config.stylix.base16Scheme.base0D}"
        }
      '';
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
      };
    };
  };
}
