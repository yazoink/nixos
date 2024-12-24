{config, lib, pkgs, ...}:
let
  customTerminalFont = pkgs.callPackage ./nec-apc-3 {};
  #customTerminalFont = pkgs.callPackage ./jf-dot-kappa-20 {};
in
{
  options = {
    desktopTheme.customTerminalFont = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
  config = lib.mkIf config.desktopTheme.customTerminalFont.enable {
    stylix.fonts.monospace = {
      name = "Bm437 NEC APC3 8x16";
      #name = "Jf Dot Kappa 20";
      package = customTerminalFont;
    };
  };
}
