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
      enableGhostscriptFonts = true;
      fontDir.enable = true;
      fontconfig = {
        allowBitmaps = true;
        useEmbeddedBitmaps = true;
        includeUserConf = true;
        localConf = ''
          <match target="font">
            <test name="family" qual="any">
              <string>Jf Dot Kappa 20</string>
            </test>
            <test name="family" qual="any">
              <string>Cozette</string>
            </test>
            <test name="family" qual="any">
              <string>Cozette Vector</string>
            </test>
            <test name="family" qual="any">
              <string>Bm437 NEC APC3 8x16</string>
            </test>
            <edit name="hinting" mode="assign">
              <bool>false</bool>
            </edit>
            <edit name="antialias" mode="assign">
              <bool>false</bool>
            </edit>
            <edit name="lcdfilter" mode="assign">
              <bool>lcddefault</bool>
            </edit>
          </match>
        '';
      };
    };
  };
}
