{pkgs, config, lib, ...}:
let
  themeName = config.desktopTheme.name;
in
{
  options = {
    desktopTheme.base16Accent = lib.mkOption {
      type = lib.types.str;
      description = "options: base0D, base0F, base09";
    };
  };
  imports = [
    ./themes
    ./terminal-fonts
  ];
  config = lib.mkIf config.myOptions.desktopTheme.enable {
    desktopTheme.base16Accent = if (themeName == "caroline") then "base0F" else 
      (if (themeName == "carob") then "base0D" else 
      (if (themeName == "tarot") then "base09" else "base0D"));
    desktopTheme.customTerminalFont.enable = true;

    environment.systemPackages = with pkgs; [
      libsForQt5.qtquickcontrols2
      libsForQt5.qtgraphicaleffects
      gtk-engine-murrine
    ];

    stylix = {
      enable = true;
      targets = {
        grub.enable = false;
      };
      cursor = {
        size = 24;
      };
      fonts = {
        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
          terminal = 12;
        };
        serif = {
          package = pkgs.gyre-fonts;
          name = "DejaVu Math TeX Gyre";
        };
        sansSerif = {
          package = pkgs.rubik;
          name = "Rubik";
        };
        monospace = {
          #package = pkgs.gohufont;
          #name = "Gohufont";
          #package = pkgs.terminus_font;
          #name = "Terminus";
        };
      };
      image = config.myOptions.desktopTheme.wallpaper;
    };
  };
}
