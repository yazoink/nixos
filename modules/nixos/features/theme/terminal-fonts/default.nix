{config, lib, pkgs, ...}:
let
  #customTerminalFont = pkgs.callPackage ./nec-apc-3 {};
  customTerminalFont = pkgs.callPackage ./jf-dot {};
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
      #name = "Bm437 NEC APC3 8x16";
      name = "JF Dot K14-2004";
      package = customTerminalFont;
    };
  };
}
