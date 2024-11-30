{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.vesktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.vesktop.enable {
    home.packages = with pkgs; [
      vesktop
    ];
    home.file.".config/vesktop/themes/carobcord.theme.css".text = ''
      /**
      * @name Carob
      * @author yazoink
      * @version 0.0.0
      * @description based on https://gitlab.com/snakedye/chocolate
      **/

      @import url('https://mwittrien.github.io/BetterDiscordAddons/Themes/DiscordRecolor/DiscordRecolor.css');

      :root {
        --accentcolor: 130,158,155;
        --accentcolor2: 153,131,150;
        --linkcolor: 130,158,155;
        --mentioncolor: 217,178,124;
        --textbrightest: 200,186,164;
        --textbrighter: 189,174,151;
        --textbright: 189,174,151;
        --textdark: 181,164,141;
        --textdarker: 181,164,141;
        --textdarkest: 173,155,132;
        --font: Rubik;
        --backgroundaccent: 59,52,49;
        --backgroundprimary: 36,33,32;
        --backgroundsecondary: 43,39,38;
        --backgroundsecondaryalt: 43,39,38;
        --backgroundtertiary: 36,33,32;
        --backgroundfloating: 36,33,32;
        --settingsicons: 1;
      }

      /* Any custom CSS below here */
    '';
  };
}
