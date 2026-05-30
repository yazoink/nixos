{pkgs, config, lib, ...}:
let
  lyricli = pkgs.callPackage ./lyricli.nix {};
in
{
  options = {
    bundles.desktopFull.lyricli.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.lyricli.enable {
    home.packages = [
      lyricli 
    ];
  };
}
