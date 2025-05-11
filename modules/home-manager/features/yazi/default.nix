{
  config,
  lib,
  osConfig,
  ...
}: let
  accent = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
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
            rules = [
              (lib.mkForce {
                fg = accent;
                mime = "inode/directory";
              })
            ];
          };
        };
      };
    };
  };
}
