{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.adb.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.adb.enable {
    environment.systemPackages = with pkgs; [
      androidenv.androidPkgs.platform-tools
    ];
    programs.adb.enable = true;
    services.udev.packages = with pkgs; [
      android-udev-rules
    ];
  };
}
