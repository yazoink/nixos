{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.displayManager == "regreet") {
    programs.regreet = {
      enable = true;
    };
  };
}
