{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  ...
}: let
  name = defaultApps.guiTextEditor;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;})
      {
        xdg.mimeApps.defaultApplications = {
          "text/plain" = [desktopFile];
          "text/x-markdown" = [desktopFile];
          "text/x-tex" = [desktopFile];
          "text/x-python" = [desktopFile];
          "text/x-ruby" = [desktopFile];
          "text/x-readme" = [desktopFile];
          "text/x-java" = [desktopFile];
          "application/x-shellscript" = [desktopFile];
          "application/xml" = [desktopFile];
          "inode/x-empty" = [desktopFile];
        };
      }
    ];
  desktopFiles = {
    pluma = "pluma.desktop";
    gedit = "gedit.desktop";
    featherpad = "featherpad.desktop";
    mousepad = "org.xfce.mousepad";
  };
in
  makeCfg name desktopFiles.${name}
