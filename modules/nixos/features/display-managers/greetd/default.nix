{inputs, pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.greetd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.greetd.enable {
    environment.etc = {
      "greetd/environments".text = ''
        Hyprland
        zsh
        bash
      '';
    };
    #stylix.targets.regreet.enable = false;
    programs.regreet = {
      enable = true;
    };
  };
}
