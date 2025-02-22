{pkgs, osConfig, lib, ...}:
let
  mpdris2-rs = pkgs.callPackage ./mpdris2-rs.nix {};
in
{
  config = lib.mkIf osConfig.bundles.desktopFull.mpd.enable {
    home.packages = builtins.trace "remember to check for mpdris2-rs updates" [mpdris2-rs];
    systemd.user.services.mpdris2-rs = {
      Unit = {
        Description = "Music Player Daemon D-Bus Bridge";
        Wants = ["mpd.service"];
        After = ["mpd.service"];
      };
      Service = {
        Restart = "on-failure";
        ExecStart = "${mpdris2-rs}/bin/mpdris2-rs";
        BusName = "org.mpris.MediaPlayer2.mpd";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
