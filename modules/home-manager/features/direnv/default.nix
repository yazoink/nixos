{config, lib, ...}:
{
  options = {
    bundles.desktopBase.direnv.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;

      stdlib = ''
        export extra_dev_shell="direnv"
      '';
    };
  };
}
