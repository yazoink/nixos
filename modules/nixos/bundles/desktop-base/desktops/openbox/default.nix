{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) openbox;
in {
  config = lib.mkIf openbox.enable (lib.mkMerge [
    (import ./openbox {inherit pkgs;})
  ]);
}
