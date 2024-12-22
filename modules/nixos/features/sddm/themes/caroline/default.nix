{config, lib, ...}:
{
  config = (lib.mkIf config.myOptions.bundles.desktopBase.sddm.enable  && config.myOptions.desktopTheme.name == "caroline") {
    services.displayManager.sddm = {
      theme = if (config.networking.hostName == "cyberia") then "caroline-small-resolution" else
        (if (config.networking.hostname == "fluoride") then "caroline-large-resolution" else "caroline");
    };
  };
}
