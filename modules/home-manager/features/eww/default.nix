{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  margin = osConfig.myOptions.desktopTheme.windowGaps.outer - 5;
in {
  options = {
    bundles.desktopBase.eww.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.eww.enable {
    home.packages = with pkgs; [eww font-awesome];
    # requires EWW_CONFIG_DIR env variable to be set to work
    # toggle power menu with launch-power-menu.sh
    # launch corners with launch-corners.sh
    xdg.configFile = {
      "widgets" = {
        source = ./config;
        recursive = true;
        force = true;
      };
      "widgets/_colours.scss".text = ''
        $border: #${base16Scheme.base01};
        $bg: #${base16Scheme.base00};
        $bg2: #${base16Scheme.base01};
        $bg3: #${base16Scheme.base02};
        $fg: #${base16Scheme.base05};
        $red: #${base16Scheme.base08};
        $yellow: #${base16Scheme.base0A};
        $green: #${base16Scheme.base0B};
        $blue: #${base16Scheme.base0D};
        $purple: #${base16Scheme.base0E};
        $margin: ${builtins.toString margin}px;
      '';
    };
  };
}
