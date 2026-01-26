{
  config,
  lib,
  pkgs-stable,
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
      # package = pkgs-stable.yazi;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        mgr = {
          ratio = [1 2 2];
          sort_by = "natural";
          linemode = "size";
          show_symlink = true;
        };
        theme = {
          status = {
            sep_left = {
              open = "";
              close = "";
            };
            sep_right = {
              open = "";
              close = "";
            };
          };
          icon = {
            globs = [];
            dirs = [];
            files = [];
            exts = [];
            conds = [];
          };
        };
      };
    };
  };
}
