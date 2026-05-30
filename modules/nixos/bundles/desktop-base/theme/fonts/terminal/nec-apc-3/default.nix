{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Bm437 NEC APC3 8x16") {
    stylix = {
      fonts = {
        monospace = {
          package = pkgs.callPackage ./nec-apc-3 {};
          name = "Bm437 NEC APC3 8x16";
        };
      };
    };
  };
}
