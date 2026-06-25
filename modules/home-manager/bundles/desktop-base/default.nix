{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkIf osConfig.myOptions.bundles.desktopBase.enable (lib.mkMerge [
  {
    bundles.desktopBase = builtins.trace "enabled desktopBase" {
      xdg.enable = true;
    };
    home.packages = with pkgs; [keepassxc];
  }
  (import ./dconf {inherit osConfig config lib pkgs inputs;})
  (import ./direnv {inherit osConfig config lib pkgs inputs;})
  (import ./xdg {inherit osConfig config lib pkgs inputs;})

  # document readers
  (lib.mkIf
    (osConfig.myOptions.defaultApps.documentReader.command == "atril")
    (import ./document-readers/atril {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.documentReader.command == "zathura")
    (import ./document-readers/zathura {inherit osConfig config lib pkgs inputs;}))

  # gui text editors
  (lib.mkIf
    (osConfig.myOptions.defaultApps.guiTextEditor.command == "pluma")
    (import ./gui-text-editors/pluma {inherit osConfig config lib pkgs inputs;}))

  # image viewers
  (lib.mkIf
    (osConfig.myOptions.defaultApps.guiTextEditor.command == "imv")
    (import ./gui-text-editors/imv {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.guiTextEditor.command == "ristretto")
    (import ./gui-text-editors/ristretto {inherit osConfig config lib pkgs inputs;}))

  # media players
  (lib.mkIf
    (osConfig.myOptions.defaultApps.mediaPlayer.command == "celluloid")
    (import ./media-players/celluloid {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.mediaPlayer.command == "mpv")
    (import ./media-players/mpv {inherit osConfig config lib pkgs inputs;}))

  # terminals
  (lib.mkIf
    (osConfig.myOptions.defaultApps.terminal.command == "alacritty")
    (import ./terminals/alacritty {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.terminal.command == "foot" || osConfig.myOptions.defaultApps.terminal.command == "footclient")
    (import ./terminals/foot {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.terminal.command == "kitty")
    (import ./terminals/kitty {inherit osConfig config lib pkgs inputs;}))

  # web browsers
  (lib.mkIf
    (osConfig.myOptions.defaultApps.webBrowser.command == "firefox")
    (import ./web-browsers/firefox {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.webBrowser.command == "librewolf")
    (import ./web-browsers/librewolf {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.webBrowser.command == "zen-twilight")
    (import ./web-browsers/zen-twilight {inherit osConfig config lib pkgs inputs;}))

  # file managers
  (lib.mkIf
    (osConfig.myOptions.defaultApps.fileManager.command == "nemo")
    (import ./file-managers/nemo {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.fileManager.command == "pcmanfn")
    (import ./file-managers/pcmanfm {inherit osConfig config lib pkgs inputs;}))
  (lib.mkIf
    (osConfig.myOptions.defaultApps.fileManager.command == "thunar")
    (import ./file-managers/thunar {inherit osConfig config lib pkgs inputs;}))
])
