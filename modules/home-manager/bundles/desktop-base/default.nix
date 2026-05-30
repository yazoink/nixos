{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    bundles.desktopBase = builtins.trace "enabled desktopBase" {
      direnv.enable = true;
      xdg.enable = true;
    };
    home.packages = with pkgs; [keepassxc];
  };

  imports = [
    ./desktops

    ./gui-text-editors
    ./document-readers
    ./terminals
    ./web-browsers
    ./image-viewers
    ./media-players

    ./direnv
    ./theme
    ./xdg
    ./dconf
  ];
}
