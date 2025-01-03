{pkgs, config, lib, ...}:
let
  myTheme = pkgs.callPackage ./my-theme.nix {inherit config;};
in
{
  config = lib.mkIf config.bundles.desktopBase.sddm.enable {
    environment.systemPackages = [myTheme];
    services.displayManager.sddm = {
      theme = "my-theme";
      settings = {
        Theme = {
          CursorTheme = config.stylix.cursor.name;
        };
      };
    };
  };
}
