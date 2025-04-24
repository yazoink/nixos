{
  config,
  lib,
  ...
}: {
  options = {
    bundles.base.tmux.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";
      clock24 = false;
    };
  };
}
