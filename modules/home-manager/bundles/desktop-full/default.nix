{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkIf osConfig.myOptions.bundles.desktopFull.enable (lib.mkMerge [
  {
    home.packages = with pkgs;
      [
        ### communication ###
        signal-desktop

        ### gui file viewers ###
        supersonic

        ### gui file editors ###
        audacity
        libreoffice-qt
        # inkscape
        # olive-editor
        shotcut
        kid3-qt
        krita

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
        typst

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
  }
  (import ./audtousd {inherit osConfig config lib pkgs inputs;})
  (import ./cava {inherit osConfig config lib pkgs inputs;})
  (import ./color-scripts {inherit osConfig config lib pkgs inputs;})
  (import ./discord-clients {inherit osConfig config lib pkgs inputs;})
  (import ./gimp {inherit osConfig config lib pkgs inputs;})
  (import ./kjtocal {inherit osConfig config lib pkgs inputs;})
  (import ./lyricli {inherit osConfig config lib pkgs inputs;})
  # (import ./mpdris2 {inherit osConfig config lib pkgs inputs;})
  # (import ./mpdris2-rs {inherit osConfig config lib pkgs inputs;})
  (lib.mkIf osConfig.services.mpd.enable
    (import ./ncmpcpp {inherit osConfig config lib pkgs inputs;}))
  (import ./newsboat {inherit osConfig config lib pkgs inputs;})
  (import ./obs {inherit osConfig config lib pkgs inputs;})
  (import ./usdtoaud {inherit osConfig config lib pkgs inputs;})
  (import ./yt-dlp {inherit osConfig config lib pkgs inputs;})
])
