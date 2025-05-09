{
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopBase.hyprlock.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprlock.enable {
    programs.hyprlock.enable = true;
    security.pam.services.hyprlock = {};
  };
}
