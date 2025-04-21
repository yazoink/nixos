{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopFull.gimp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.gimp.enable {
    home.packages = with pkgs; [gimp3-with-plugins];
    xdg.configFile = {
      "GIMP/2.10/palettes/carob.gpl".source = ./palettes/carob.gpl;
      "GIMP/2.10/palettes/caroline.gpl".source = ./palettes/caroline.gpl;
      "GIMP/2.10/palettes/manuscript.gpl".source = ./palettes/manuscript.gpl;
      "GIMP/2.10/palettes/rose-pine-moon.gpl".source = ./palettes/rose-pine-moon.gpl;
      "GIMP/2.10/palettes/tarot.gpl".source = ./palettes/tarot.gpl;
      "GIMP/2.10/palettes/website.gpl".source = ./palettes/website.gpl;
    };
  };
}
