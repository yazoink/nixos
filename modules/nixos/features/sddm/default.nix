{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.sddm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  imports = [./themes];
  config = lib.mkIf config.bundles.desktopBase.sddm.enable {
    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols2
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
