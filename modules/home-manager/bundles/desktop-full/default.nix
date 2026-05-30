{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.bundles.desktopFull.enable {
    bundles.desktopFull = {
      audtousd.enable = true;
      colorScripts.enable = true;
      gimp.enable = true;
      kjtocal.enable = true;
      # kooha.enable = true;
      obs.enable = true;
      lyricli.enable = true;
      ncmpcpp.enable = true;
      newsboat.enable = true;
      # soundboard.enable = true; # broken, fix later
      usdtoaud.enable = true;
      ytDlp.enable = true;
      cava.enable = true;
    };

    home.packages = with pkgs;
      [
        ### communication ###
        signal-desktop

        ### gui file viewers ###
        supersonic

        ### gui file editors ###
        audacity
        libreoffice-qt
        inkscape
        # olive-editor
        shotcut
        kid3-qt

        ### gui utilities ###
        # easyeffects
        transmission_4-gtk
        bleachbit
        #qbittorrent-enhanced
        nicotine-plus
        kdePackages.kruler
        #gnome-maps
        #gnome-clocks
        #gnome-disk-utility
        gnome-font-viewer
        # galculator
        # d-spy
        filezilla

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
        # wineWowPackages.waylandFull
        # factorio
      ]
      ++ (
        if osConfig.services.printing.enable
        then with pkgs; [system-config-printer]
        else []
      );
  };
  imports = [
    ./discord-clients

    ./audtousd
    ./color-scripts
    ./gimp
    ./kjtocal
    # ./kooha
    ./obs
    ./lyricli
    ./ncmpcpp
    ./newsboat
    # ./soundboard
    ./usdtoaud
    ./yt-dlp
    # ./mpdris2-rs
    ./mpdris2
    ./cava
  ];
}
