{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./themes
    ./fonts
  ];
  config = lib.mkIf config.desktopTheme.stylix.enable {
    environment.systemPackages = with pkgs; [
      gtk-engine-murrine
    ];

    stylix = builtins.trace "stylix enabled" {
      enable = true;
      polarity = lib.mkDefault "dark";
      targets = {
        grub.enable = false;
        qt.enable = false;
      };
      icons = {
        enable = true;
        light = lib.mkDefault "Papirus";
        dark = lib.mkDefault "Papirus";
        package = lib.mkDefault pkgs.papirus-icon-theme;
      };
      cursor = {
        size = lib.mkDefault 32;
        name = lib.mkDefault "Posy_Cursor";
        package = lib.mkDefault pkgs.posy-cursors;
      };
      fonts = {
        sizes = {
          applications = config.myOptions.desktopTheme.fonts.desktop.size;
          desktop = config.myOptions.desktopTheme.fonts.desktop.size;
          popups = config.myOptions.desktopTheme.fonts.desktop.size;
          terminal = config.myOptions.desktopTheme.fonts.terminal.size;
        };
        serif = {
          package = pkgs.gyre-fonts;
          # name = "DejaVu Math TeX Gyre";
          name = "TeX Gyre Schola";
        };
      };
      image = config.myOptions.desktopTheme.wallpaper.image.path;
    };
  };
}
