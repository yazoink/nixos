{config, lib, pkgs, ...}:
let
  customTerminalFont = pkgs.callPackage ./nec-apc-3 {};
in
{
  options = {
    desktopTheme.customTerminalFont = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      name = lib.mkOption {
        type = lib.types.string;
      };
      package = lib.mkOption {
        type = lib.types.package;
      };
    };
  };
  config = lib.mkIf config.bundles.desktopTheme.customTerminalFont.enable {
    desktopTheme.customTerminalFont = {
      name = "Bm437 NEC APC3 8x16";
      package = customTerminalFont;
    };
  };
}
