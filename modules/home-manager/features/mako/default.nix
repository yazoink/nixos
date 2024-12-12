{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.mako.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.mako.enable {
    home.packages = with pkgs; [
      libnotify
    ];
    services.mako = {
      enable = true;
      icons = true;
      anchor = "top-right";
      borderRadius = 5;
      borderColor = lib.mkForce "#${config.stylix.base16Scheme.base01}";
      padding = "10";
      margin = "5";
      borderSize = 2;
      defaultTimeout = 5000;
      iconPath = "/run/current-system/sw/share/icons/${config.gtk.iconTheme.name}";
    };
  };
}
