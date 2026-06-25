{config, ...}: let
  inherit (config.stylix) polarity;
  inherit (config.lib.stylix) colors;
in {
  stylix.targets.nixvim = {
    transparentBackground.numberLine = true;
    transparentBackground.signColumn = true;
  };
}
