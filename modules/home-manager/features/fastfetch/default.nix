{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.base.fastfetch.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "apple";
        };
        modules = [
          {
            type = "break";
          }
          {
            type = "break";
          }
          {
            type = "title";
          }
          {
            type = "break";
          }
          {
            type = "os";
          }
          {
            type = "kernel";
          }
          {
            type = "uptime";
          }
          {
            type = "shell";
          }
          {
            type = "wm";
          }
          {
            type = "terminal";
          }
          {
            type = "cpu";
          }
          {
            type = "gpu";
          }
          {
            type = "memory";
          }
          {
            type = "swap";
          }
          {
            type = "break";
          }
          {
            type = "colors";
          }
        ];
      };
    };
  };
}
