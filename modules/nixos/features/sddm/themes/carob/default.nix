{config, lib, ...}:
{
  config = (lib.mkIf config.myOptions.bundles.desktopBase.sddm.enable  && config.myOptions.desktopTheme.name == "carob") {
    services.displayManager.sddm = {
      theme = if (config.networking.hostName == "cyberia") then "carob-small-resolution" else
        (if (config.networking.hostname == "fluoride") then "carob-large-resolution" else "carob");
    };
  };
}
