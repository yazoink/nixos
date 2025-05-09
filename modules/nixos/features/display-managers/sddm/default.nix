{
  config,
  lib,
  pkgs,
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
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
    ];
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
