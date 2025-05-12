{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "regreet" && config.myOptions.bundles.desktopBase.enable) {
    programs.regreet = {
      enable = true;
    };
  };
}
