{pkgs, config, lib, ...}:
let
  inherit (config.desktopTheme) customTerminalFont customDesktopFont;
in
{
  options = {
    desktopTheme.base16Accent = lib.mkOption {
      type = lib.types.str;
      description = "options: base09, base0A, base0B, base0C, base0D, base0E, base0F";
    };
  };
  imports = [
    ./themes
    ./terminal-fonts
    ./desktop-fonts
  ];
  config = lib.mkIf config.myOptions.bundles.desktopBase.enable {
    desktopTheme.customTerminalFont.enable = true;
    desktopTheme.customDesktopFont.enable = false;

    environment.systemPackages = with pkgs; [
      libsForQt5.qtquickcontrols2
      libsForQt5.qtgraphicaleffects
      gtk-engine-murrine
      bibata-cursors
    ];

    stylix = {
      enable = true;
      targets = {
        grub.enable = false;
      };
      cursor = {
        size = 24;
        name = lib.mkDefault "Bibata-Modern-Classic";
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
        sansSerif = lib.mkIf (customDesktopFont.enable == false) {
          package = pkgs.rubik;
          name = "Rubik";
        };
        monospace = lib.mkIf (customTerminalFont.enable == false) {
          #package = pkgs.gohufont;
          #name = "Gohufont";
          package = pkgs.terminus_font;
          name = "Terminus";
        };
      };
      image = config.myOptions.desktopTheme.wallpaper;
    };
  };
}
