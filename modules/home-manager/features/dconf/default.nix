{lib, osConfig, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.dconf.enable {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        font-antialiasing = "rgba";
        text-scaling-factor = 1;
      };
    };
  };
}
