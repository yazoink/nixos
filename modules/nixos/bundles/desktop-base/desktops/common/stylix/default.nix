{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.bundles.desktopBase.desktop) desktop;
  theme = desktop.colorscheme;
  monoFont = desktop.fonts.terminal;
  sansFont = desktop.fonts.desktop;
  image = desktop.wallpaper.image;
in {
  environment.systemPackages = with pkgs; [
    gtk-engine-murrine
  ];

  stylix = lib.mkMerge [
    {
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
      fonts = lib.mkMerge [
        {
          sizes = {
            applications = sansFont.size;
            desktop = sansFont.size;
            popups = sansFont.desktop.size;
            terminal = sansFont.size;
          };
          serif = {
            package = pkgs.gyre-fonts;
            # name = "DejaVu Math TeX Gyre";
            name = "TeX Gyre Schola";
          };
        }
        (import ./fonts {
          inherit pkgs lib;
          monoFont = monoFont.name;
          sansFont = sansFont.name;
        })
      ];
      image = image;
    }
    (import ./themes {inherit pkgs theme;})
  ];
}
