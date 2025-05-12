{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.myOptions.bundles.desktopBase.plymouth.enable {
    boot.plymouth.enable = true;
  };
}
