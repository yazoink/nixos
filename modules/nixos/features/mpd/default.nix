{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.mpd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/${config.myOptions.userAccount.username}/mu";
      user = "${config.myOptions.userAccount.username}";
      # Optional:
      network.listenAddress = "any"; # if you want to allow non-localhost connections

      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output" # this can be whatever you want
        }

        audio_output {
          type "fifo"
          name "my_fifo"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
        }
      '';
    };

    systemd.services.mpd.environment = {
      # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
      XDG_RUNTIME_DIR = "/run/user/1000"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
    };

    environment.systemPackages = with pkgs; [
      #cantata (abandoned/broken)
      ario
      mpc-cli
    ];
  };
}
