{
  config,
  lib,
  ...
}: {
  options = {
    config.myOptions.bundles.desktopBase.silentBoot.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.myOptions.bundles.desktopBase.silentBoot.enable {
    boot = {
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
      # loader.timeout = 0;
    };
  };
}
