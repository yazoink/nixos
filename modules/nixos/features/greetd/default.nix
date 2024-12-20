{inputs, pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.greetd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.greetd.enable {
    environment.etc = {
      "greetd/environments".text = ''
        Hyprland
        zsh
        bash
      '';
    };
    #stylix.targets.regreet.enable = false;
    programs.regreet = {
      enable = true;
      package = pkgs.greetd.regreet;
      extraCss = with config.stylix.base16Scheme; lib.mkForce ''
        window {
          color: #${base05};
          background-color: #${base00};
        }
        entry, button, input {
          color: #${base05};
          background-color: #${base01};
        }
        input:selected {
          border: 2px solid #${base0F};
        }
      '';
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.cage} -s -- ${lib.getExe config.programs.regreet.package}";
          user = "greeter";
        };
      };
    };
  };
}
