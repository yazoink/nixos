{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopFull.enable {
    bundles.desktopFull = {
      etterna.enable = true;
      firefox.enable = true;
      kjtocal.enable = true;
      kooha.enable = true;
      ncmpcpp.enable = true;
      vesktop.enable = true;
      ytDlp.enable = true;
    };


    home.packages = with pkgs; [
      ### gaming ##
      prismlauncher
      osu-lazer-bin
      mangohud

      ### communication ###
      signal-desktop

      ### gui file viewers ###
      vlc
      evince
      xfce.mousepad
      sublime-music

      ### gui file editors ###
      audacity
      gimp-with-plugins
      libreoffice-qt
      inkscape
      shotcut

      ### gui utilities ###
      keepassxc
      easyeffects
      transmission_4-gtk
      nicotine-plus
      kdePackages.kruler

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
      wineWowPackages.waylandFull
    ] ++ (if osConfig.services.printing.enable then 
        with pkgs; [system-config-printer] else []);
  };
  imports = [
    ../../features/etterna
    ../../features/firefox
    ../../features/kjtocal
    ../../features/kooha
    ../../features/ncmpcpp
    ../../features/vesktop
    ../../features/vscode
    ../../features/yt-dlp
  ];
}
