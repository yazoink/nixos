{pkgs, config, lib, ...}:
let
  hyprViewBinds = pkgs.callPackage ./hyprviewbinds.nix {};
in
{
  options = {
    bundles.desktopBase.hyprViewBinds.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprViewBinds.enable {
    home.packages = [
      hyprViewBinds 
      pkgs.python3
      pkgs.gobject-introspection
      pkgs.gtk3
    ];
    home.file = {  
      ".local/share/applications/hyprviewbinds.desktop".source = ./hyprviewbinds.desktop;
      ".local/share/hyprviewbinds/icon.png".source = ./icon.png;
    };
  };
}
