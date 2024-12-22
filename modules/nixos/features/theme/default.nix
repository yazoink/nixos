{pkgs, config, lib, ...}:
{
  imports = [
    ./themes
    ./terminal-fonts
  ];
  config = lib.mkIf config.myOptions.desktopTheme.enable {
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
          name = config.desktopTheme.customTerminalFont.name;
          package = config.desktopTheme.customTerminalFont.package;
        };
      };
      image = config.myOptions.desktopTheme.wallpaper;
    };
  };
}
