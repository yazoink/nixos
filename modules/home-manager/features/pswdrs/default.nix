{pkgs, config, lib, ...}:
let
  pswdrs = pkgs.callPackage ./pswdrs.nix {};
in
{
  options = {
    bundles.base.pswdrs.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.pswdrs.enable {
    home.packages = [pswdrs];
  };
  home.file.".config/pswdrs/words.txt".source = ./words.txt;
}
