{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.fonts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      font-awesome
      nerdfonts
      twemoji-color-font
      material-symbols
      terminus_font
      terminus_font_ttf
      _0xproto
    ];

    fonts = {
      fontconfig.allowBitmaps = true;
      fontDir.enable = true;
      enableGhostscriptFonts = true;
    };
  };
}
