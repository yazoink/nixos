{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopFull.enable {
    bundles.desktopFull = {
      audtousd.enable = true;
      colorScripts.enable = true;
      kjtocal.enable = true;
      kooha.enable = true;
      lyricli.enable = true;
      ncmpcpp.enable = true;
      newsboat.enable = true;
      soundboard.enable = true;
      usdtoaud.enable = true;
      vesktop.enable = true;
      ytDlp.enable = true;
    };

    home.packages = with pkgs; [
      ### communication ###
      signal-desktop

      ### gui file viewers ###
      vlc
      mate.atril
      sublime-music

      ### gui file editors ###
      mate.pluma
      audacity
      gimp-with-plugins
      libreoffice-qt
      inkscape
      shotcut

      ### gui utilities ###
      keepassxc
      easyeffects
      transmission_4-gtk
      bleachbit
      #qbittorrent-enhanced
      nicotine-plus
      kdePackages.kruler
      #gnome-maps
      #gnome-clocks
      #gnome-disk-utility
      gnome-font-viewer
      galculator
      d-spy

      ### programming ####
      texliveFull
      zig
      php
      cmake
      gcc
      gnumake
      clang-tools
      python3

      ### misc ###
      cbonsai
      wineWowPackages.waylandFull
    ] ++ (if osConfig.services.printing.enable then 
        with pkgs; [system-config-printer] else []);
  };
  imports = [
    ../../features/audtousd
    ../../features/color-scripts
    ../../features/kjtocal
    ../../features/kooha
    ../../features/lyricli
    ../../features/ncmpcpp
    ../../features/newsboat
    ../../features/soundboard
    ../../features/usdtoaud
    ../../features/vesktop
    ../../features/vscode
    ../../features/yt-dlp
  ];
}
