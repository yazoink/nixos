# stylix theming
{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (config.lib.stylix) colors;
in
  lib.mkMerge [
    (import ./gtk {inherit config osConfig lib colors;})
    (import ./qt {inherit config pkgs osConfig lib colors;})

    (import ./imv {inherit config pkgs osConfig lib colors;})
    (import ./kitty {inherit config pkgs osConfig lib colors;})
    (import ./firefox {inherit config pkgs osConfig lib colors;})
    (import ./zen {inherit config pkgs osConfig lib colors;})
    (import ./vim {inherit config pkgs osConfig lib colors;})
    (import ./cava {inherit config pkgs osConfig lib colors;})
    (import ./vesktop {inherit config pkgs osConfig lib colors;})
    (import ./lutgen {inherit config pkgs osConfig lib colors;})
    (import ./gedit {inherit config pkgs osConfig lib colors;})
    {
      xdg.configFile."colors.css".text = with colors; ''
        @define-color base00 #${base00};
        @define-color base01 #${base01};
        @define-color base02 #${base02};
        @define-color base03 #${base03};
        @define-color base04 #${base04};
        @define-color base05 #${base05};
        @define-color base06 #${base06};
        @define-color base07 #${base07};
        @define-color base08 #${base08};
        @define-color base09 #${base09};
        @define-color base0A #${base0A};
        @define-color base0B #${base0B};
        @define-color base0C #${base0C};
        @define-color base0D #${base0D};
        @define-color base0E #${base0E};
        @define-color base0F #${base0F};

        @define-color surface rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.09);
      '';
    }
  ]
