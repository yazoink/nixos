{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./theme];
  config = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "sddm" && config.myOptions.bundles.desktopBase.enable) {
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
