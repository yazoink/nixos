{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.hardwareFeatures.diskBurner.enable {
    environment.systemPackages = with pkgs; [
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
    programs.k3b.enable = true;
    /*services.udisks2.enable = true;
    security.wrappers = {
      cdrao = {
        setuid = true;
        owner = "root";
        group = "cdrom";
        permissions = "u+wrx,g+x";
        source = "${pkgs.cdrdao}/bin/cdrdao";
      };
      cdrecord = {
        setuid = true;
        owner = "root";
        group = "cdrom";
        permissions = "u+wrx,g+x";
        source = "${pkgs.cdrtools}/bin/cdrecord";
      };
    };*/
  };
}
