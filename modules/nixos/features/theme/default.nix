{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    desktopTheme.base16Accent = lib.mkOption {
      type = lib.types.str;
      description = "options: base09, base0A, base0B, base0C, base0D, base0E, base0F";
    };
  };
  imports = [
    ./themes
    ./fonts
  ];
  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qtquickcontrols2
      libsForQt5.qtgraphicaleffects
      gtk-engine-murrine
    ];

    stylix = {
      enable = true;
      polarity = lib.mkDefault "dark";
      targets = {
        grub.enable = false;
        qt.enable = false;
      };
      cursor = {
        size = lib.mkDefault 24;
        name = lib.mkDefault "macOS";
        package = pkgs.apple-cursor;
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
          name = "DejaVu Math TeX Gyre";
        };
      };
      image = config.myOptions.desktopTheme.wallpaper.image;
    };
  };
}
