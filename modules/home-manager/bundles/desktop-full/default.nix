{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopFull.enable {
    bundles.desktopFull = {
      audtousd.enable = true;
      colorScripts.enable = true;
      gimp.enable = true;
      kjtocal.enable = true;
      kooha.enable = true;
      lyricli.enable = true;
      ncmpcpp.enable = true;
      newsboat.enable = true;
      soundboard.enable = true;
      usdtoaud.enable = true;
      ytDlp.enable = true;
    };

    home.packages = with pkgs; [
      ### communication ###
      signal-desktop

      ### gui file viewers ###
      sublime-music

      ### gui file editors ###
      audacity
      libreoffice-qt
      inkscape
      #shotcut

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
      tty-solitaire
      cbonsai
      eduke32
      wineWowPackages.waylandFull
    ] ++ (if osConfig.services.printing.enable then 
        with pkgs; [system-config-printer] else []);
  };
  imports = [
    ../../features/discord-clients

    ../../features/audtousd
    ../../features/color-scripts
    ../../features/gimp
    ../../features/kjtocal
    ../../features/kooha
    ../../features/lyricli
    ../../features/ncmpcpp
    ../../features/newsboat
    ../../features/soundboard
    ../../features/usdtoaud
    ../../features/yt-dlp
    ../../features/mpdris2
  ];
}
