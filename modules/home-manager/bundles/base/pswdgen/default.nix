{pkgs, config, lib, ...}:
let
  pswdgen = pkgs.callPackage ./pswdgen.nix {};
in
{
  options = {
    bundles.base.pswdgen.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.pswdgen.enable {
    home.packages = [pswdgen];
  };
}
