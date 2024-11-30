{pkgs, config, lib, ...}:
let
  simpleLogout = pkgs.callPackage ./simple-logout.nix {};
in
{
  options = {
    bundles.desktopBase.simpleLogout.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.simpleLogout.enable {
    home.packages = [simpleLogout];
    home.file.".config/simple-logout".source = ./config;
  };
}
