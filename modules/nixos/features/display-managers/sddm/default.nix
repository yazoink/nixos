{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopBase.sddm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  imports = [./theme];
  config = lib.mkIf config.bundles.desktopBase.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Theme = {
          CursorTheme = config.stylix.cursor.name;
        };
      };
    };
  };
}
