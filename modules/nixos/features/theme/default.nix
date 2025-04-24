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
      gtk-engine-murrine
    ];

    stylix = builtins.trace "stylix enabled" {
      enable = true;
      polarity = lib.mkDefault "dark";
      targets = {
        grub.enable = false;
        qt.enable = false;
      };
      cursor = {
        size = lib.mkDefault 32;
        name = lib.mkDefault "phinger-cursors-dark";
        package = lib.mkDefault pkgs.phinger-cursors;
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
      image = config.myOptions.desktopTheme.wallpaper.image.path;
    };
  };
}
