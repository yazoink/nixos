{lib, ...}: {
  # ----- BUNDLES ----- #
  #
  # These are bundles of modules and packages that suit different system
  # configurations.
  #
  #
  # Base: The base modules and packages needed to get a working console.
  #
  # Desktop Base: The modules and packages for a working console + basic
  # desktop. It provides a file manager, terminal, media player, document
  # reader, image viewer, text editor, and web browser but no extra apps.
  #
  # Desktop Full: The modules and packages needed for a working console and
  # fully-featured desktop.

  options.myOptions.bundles = {
    base = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      ssh = {
        allowPasswordAuth = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Allow SSH authentication via password";
        };
        allowRootLogin = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Allow root login via SSH";
        };
      };
      starshipFormat = lib.mkOption {
        type = lib.types.number;
        default = 2;
        description = ''
          Theme/format for Starship prompt.

          Options:
            1: Best for bitmap fonts
            2: Best for regulat fonts
            3 (or any other number): default
        '';
      };
    };
    desktopBase = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      plymouth.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      silentBoot.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      mpv = {
        profile = lib.mkOption {
          type = lib.types.str;
          default = "gpu-hq";
          description = "Sets 'profile' in MPV config";
        };
      };
    };
    desktopFull = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      vesktop = {
        bloat = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Setting to false installs less plugins.";
        };
      };
    };
  };
}
