{pkgs, config, lib, ...}:
let
  soundboard = pkgs.callPackage ./soundboard.nix {};
in
{
  options = {
    bundles.desktopFull.soundboard.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.soundboard.enable {
    home.packages = [
      soundboard 
    ];
    xdg.configFile."soundboard/config.json".text = ''
{
  "max_per_row": 4,
  "buttons": [
    {
      "label": "Ahhh",
      "audio": "${soundboard}/share/soundboard/sounds/ahhh.wav"
    },
    {
      "label": "Android Beep",
      "audio": "${soundboard}/share/soundboard/sounds/android-beep.wav"
    },
    {
      "label": "Fart",
      "audio": "${soundboard}/share/soundboard/sounds/fart.wav"
    },
    {
      "label": "Hey Guys",
      "audio": "${soundboard}/share/soundboard/sounds/hey-guys-whats-going-on.wav"
    },
    {
      "label": "Snore Mimimimi",
      "audio": "${soundboard}/share/soundboard/sounds/snore-mimimimimimi.wav"
    },
    {
      "label": "Sus",
      "audio": "${soundboard}/share/soundboard/sounds/sus.wav"
    },
    {
      "label": "Vine Boom",
      "audio": "${soundboard}/share/soundboard/sounds/vine-boom.wav"
    },
    {
      "label": "Windows Error",
      "audio": "${soundboard}/share/soundboard/sounds/win-error.wav"
    },
    {
      "label": "Windows XP Shutdown",
      "audio": "${soundboard}/share/soundboard/sounds/winxp-shutdown.wav"
    },
    {
      "label": "Kahoot",
      "audio": "${soundboard}/share/soundboard/sounds/cartoon-run-1.wav"
    },
    {
      "label": "Cartoon Run 1",
      "audio": "${soundboard}/share/soundboard/sounds/kahoot.wav"
    },
    {
      "label": "Cartoon Run 2",
      "audio": "${soundboard}/share/soundboard/sounds/cartoon-run-2.wav"
    },
    {
      "label": "Cartoon Run 3",
      "audio": "${soundboard}/share/soundboard/sounds/cartoon-run-3.wav"
    },
    {
      "label": "Cartoon Run 4",
      "audio": "${soundboard}/share/soundboard/sounds/cartoon-run-4.wav"
    }
  ]
}
    '';
    home.file = {  
      ".local/share/applications/soundboard.desktop".source = ./soundboard.desktop;
      ".local/share/icons/soundboard.png".source = ./icon.png;
    };
  };
}
