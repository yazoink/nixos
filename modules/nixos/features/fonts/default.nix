{pkgs, config, lib, ...}:
#let
  #kirsch = pkgs.callPackage ./kirsch.nix {};
#in
{
  options = {
    bundles.desktopBase.fonts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.fonts.enable {
    fonts.packages = with pkgs; [
      liberation_ttf
      noto-fonts
      noto-fonts-emoji
      font-awesome
      twemoji-color-font
      material-symbols
      terminus_font
      terminus_font_ttf
      nerd-fonts.terminess-ttf
      _0xproto
    ];

    fonts = {
      fontconfig.allowBitmaps = true;
      fontDir.enable = true;
      enableGhostscriptFonts = true;
      fonts.fontConfig.defaultFonts.monospace = [config.home-manager.users."${config.myOptions.userAccount.username}".stylix.fonts.monospace.name "Terminus"];
    };
  };
}
