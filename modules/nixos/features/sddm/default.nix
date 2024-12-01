{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.sddm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.sddm.enable {
    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols2
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = if config.networking.hostName == "cyberia" then "carob-small-resolution" else (if (config.networking.hostName == "fluoride") then "carob-large-resolution" else "carob");
      settings = {
        Theme = {
          CursorTheme = "Bibata-Carob";
        };
      };
    };
  };
}
