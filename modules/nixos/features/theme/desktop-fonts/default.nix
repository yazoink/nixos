{config, lib, pkgs, ...}:
let
  customDesktopFont = pkgs.callPackage ./sf-pro-display {};
in
{
  options = {
    desktopTheme.customDesktopFont = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
  config = lib.mkIf config.desktopTheme.customDesktopFont.enable {
    stylix.fonts.sansSerif = {
      name = "SF Pro Display";
      package = customDesktopFont;
    };
  };
}
