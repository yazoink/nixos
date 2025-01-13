{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.hardwareFeatures.diskBurner.enable {
    home.packages = with pkgs; [
      brasero
      cdrdao
      cdrtools
      dvdplusrwtools
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
    ];
  };
}
