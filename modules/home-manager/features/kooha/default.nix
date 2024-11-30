{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.kooha.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.kooha.enable {
    home.packages = with pkgs; [
      kooha
      x264
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
    ];
  };
}
