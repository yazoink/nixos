{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme;
in {
  options = {
    bundles.desktopBase.eww.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.eww.enable {
    home.packages = with pkgs; [eww];
    xdg.configFile = {
      "widgets/images".source = ./config/images;
      "widgets/scripts".source = ./config/scripts;
      "widgets/widgets".source = ./config/widgets;
      "widgets/windows".source = ./config/windows;
      "widgets/eww.yuck".source = ./config/eww.yuck;
      "widgets/launch-power-menu.sh".source = ./config/launch-power-menu.sh;
      "widgets/eww.scss".text =
        ''
          $border: #${base16Scheme.base01};
          $bg2: #${base16Scheme.base02};
          $bg: #${base16Scheme.base00};
          $fg: #${base16Scheme.base05};
          $red: #${base16Scheme.base08};
          $yellow: #${base16Scheme.base0A};
          $green: #${base16Scheme.base0B};
          $blue: #${base16Scheme.base0D};
          $purple: #${base16Scheme.base0E};
        ''
        + builtins.readFile ./config/eww.scss;
    };
  };
}
