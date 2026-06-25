{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  config =
    lib.mkIf osConfig.myOptions.bundles.desktopBase.enable
    {
      bundles.desktopBase = builtins.trace "enabled desktopBase" {
        direnv.enable = true;
        xdg.enable = true;
      };
      home.packages = with pkgs; [keepassxc];
    };

  imports = [
    ./rices

    ./gui-text-editors
    ./document-readers
    ./terminals
    ./web-browsers
    ./image-viewers
    ./media-players

    ./direnv
    ./xdg
    ./dconf
  ];
}
