# stylix theming
{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}:
lib.mkMerge [
  (import ./gtk {inherit config osConfig lib;})
  (import ./qt {inherit config pkgs osConfig lib;})

  (import ./imv {inherit config pkgs osConfig lib;})
  (import ./kitty {inherit config pkgs osConfig lib;})
  (import ./firefox {inherit config pkgs osConfig lib;})
  (import ./zen {inherit config pkgs osConfig lib;})
  (import ./vim {inherit config pkgs osConfig lib;})
  (import ./cava {inherit config pkgs osConfig lib;})
  (import ./vesktop {inherit config pkgs osConfig lib;})
  (import ./lutgen {inherit config pkgs osConfig lib;})
  {
    xdg.configFile."colors.css".text = with config.lib.stylix.colors; ''
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
